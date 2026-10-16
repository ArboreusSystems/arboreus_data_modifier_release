// ----------------------------------------------------------
/*!
	\class AModifierService
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/11/2025 at 18:15:45
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "dmcoreservice.h"

// Namesapce
using namespace ARB;
using namespace std;


// -----------
/*!
	\fn

	Doc.
*/

DMCoreService::DMCoreService(QObject* parent) : AThreadServiceTemplate(parent) {

	pDriver = qobject_cast<DMCoreDriverInterface*>(new DMCoreSSLDriver(this));

	_A_DEBUG << "AModifierService created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMCoreService::~DMCoreService(void) {

	mPasswordDelete();

	_A_DEBUG << "AModifierService created";
}


// -----------
/*!
	\fn

	Doc.
*/

QByteArray DMCoreService::mKeyBytes() {

	return pKey;
}


// -----------
/*!
	\fn

	Doc.
*/

QByteArray DMCoreService::mVectorBytes(void) {

	if (pPassword.isEmpty()) {
		_A_WARNING << "Cannot derive secure vector payload: pPassword buffer register is empty.";
		return QByteArray();
	}

	QByteArray oDerivedIV;
	oDerivedIV.resize(16);
	mLockBuffer(oDerivedIV.data(), oDerivedIV.size());

	EVP_KDF* oKDF = EVP_KDF_fetch(nullptr,"PBKDF2",nullptr);
	if (!oKDF) {
		_A_WARNING << "OpenSSL EVP_KDF fetch operations failed.";
		mUnlockAndClear(oDerivedIV.data(), oDerivedIV.size());
		return QByteArray();
	}

	EVP_KDF_CTX* oContext = EVP_KDF_CTX_new(oKDF);
	if (!oContext) {
		_A_WARNING << "OpenSSL EVP_KDF context allocation failed.";
		EVP_KDF_free(oKDF);
		mUnlockAndClear(oDerivedIV.data(),oDerivedIV.size());
		return QByteArray();
	}

	static const unsigned char oSalt[16] = {
		0xA4, 0x1F, 0x88, 0xCE, 0x32, 0xD9, 0x77, 0xBB,
		0x5E, 0x02, 0xF6, 0x4D, 0x90, 0xBA, 0x11, 0x66
	};

	unsigned int oIterations = __PBKDF2_ITERATIONS;

	OSSL_PARAM oParameters[5];
	oParameters[0] = OSSL_PARAM_construct_utf8_string(
		OSSL_KDF_PARAM_DIGEST,const_cast<char*>("SHA512"),0
	);
	oParameters[1] = OSSL_PARAM_construct_octet_string(
		OSSL_KDF_PARAM_PASSWORD,const_cast<char*>(pPassword.constData()),pPassword.size()
	);
	oParameters[2] = OSSL_PARAM_construct_octet_string(
		OSSL_KDF_PARAM_SALT,const_cast<void*>(static_cast<const void*>(oSalt)),sizeof(oSalt)
	);
	oParameters[3] = OSSL_PARAM_construct_uint(
		OSSL_KDF_PARAM_ITER,&oIterations
	);
	oParameters[4] = OSSL_PARAM_construct_end();

	if (EVP_KDF_derive(oContext,reinterpret_cast<unsigned char*>(oDerivedIV.data()),oDerivedIV.size(),oParameters) != 1) {
		_A_WARNING << "OpenSSL EVP_KDF derivation sequence mapping execution failed.";
		OPENSSL_cleanse(oDerivedIV.data(),oDerivedIV.size());
		mUnlockAndClear(oDerivedIV.data(),oDerivedIV.size());
		oDerivedIV.clear();
	}

	EVP_KDF_CTX_free(oContext);
	EVP_KDF_free(oKDF);

	return oDerivedIV;
}


// -----------
/*!
	\fn

	Doc.
*/

bool DMCoreService::mIsPasswordDefined(void) {

	_A_DEBUG << "pPassword.isEmpty()" << pPassword.isEmpty();

	return !pPassword.isEmpty();
}


// -----------
/*!
	\fn

	Doc.
*/

bool DMCoreService::mPasswordSet(QString& inPassword) {

	mMemoryClear();

	if (inPassword.isEmpty()) return false;

	const int oPassLength = inPassword.length();
	const size_t oRawByteSize = oPassLength * sizeof(ushort);

	pPassword.resize(oRawByteSize);
	mLockBuffer(pPassword.data(), pPassword.size());

	ushort* pRawTarget = reinterpret_cast<ushort*>(pPassword.data());
	const QChar* pRawSource = inPassword.constData();
	for (int i = 0; i < oPassLength; ++i) pRawTarget[i] = pRawSource[i].unicode();

	static const unsigned char oSalt[32] = {
		0x5E, 0xA1, 0x9B, 0xC4, 0x12, 0xF9, 0x88, 0x3D,
		0xA2, 0x4F, 0xC1, 0x0E, 0x77, 0xBA, 0xD4, 0x66,
		0x90, 0x11, 0x2E, 0xCF, 0x8A, 0x43, 0xD7, 0x50,
		0xBB, 0xCC, 0x1F, 0x02, 0x69, 0xEE, 0x4D, 0x8F
	};

	pKey.resize(__KEY_SIZE);
	mLockBuffer(pKey.data(), pKey.size());

	int oResult = PKCS5_PBKDF2_HMAC(
		reinterpret_cast<const char*>(pRawTarget),
		static_cast<int>(pPassword.size()),
		oSalt,
		sizeof(oSalt),
		__PBKDF2_ITERATIONS,
		EVP_sha512(),
		__KEY_SIZE,
		reinterpret_cast<unsigned char*>(pKey.data())
	);

	QChar* pIncomingData = inPassword.data();
	for (int i = 0; i < oPassLength; ++i) {
		pIncomingData[i] = QChar(0);
	}
	inPassword.clear();
	inPassword.squeeze();

	std::atomic_thread_fence(std::memory_order_release);

	if (oResult != 1) {
		mMemoryClear();
		_A_WARNING << "PBKDF2 Derivation Failed!";
		return false;
	}

	return true;
}


// -----------
/*!
	\fn

	Doc.
*/

QString DMCoreService::mPasswordGet(void) {

	if (pPassword.isEmpty()) return QString();

	const size_t oByteSize = pPassword.size();
	const int oPassLength = static_cast<int>(oByteSize / sizeof(ushort));

	if (oPassLength <= 0) return QString();

	const ushort* pRawSource = reinterpret_cast<const ushort*>(pPassword.constData());

	QString oDecodedPassword;
	oDecodedPassword.resize(oPassLength);

	QChar* pRawTarget = oDecodedPassword.data();
	for (int i = 0; i < oPassLength; ++i) pRawTarget[i] = QChar(pRawSource[i]);

	oDecodedPassword.detach();
	std::atomic_thread_fence(std::memory_order_release);

	return oDecodedPassword;
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCoreService::mPasswordDelete(void) {

	mMemoryClear();

	pPassword = QByteArray();
	pKey = QByteArray();
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCoreService::mMemoryClear(void) {

	if (!pPassword.isEmpty()) {

		OPENSSL_cleanse(pPassword.data(),pPassword.size());
		mUnlockAndClear(pPassword.data(),pPassword.size());
		pPassword.clear();
		pPassword.squeeze();
	}

	if (!pKey.isEmpty()) {

		OPENSSL_cleanse(pKey.data(),pKey.size());
		mUnlockAndClear(pKey.data(),pKey.size());
		pKey.clear();
		pKey.squeeze();
	}
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCoreService::slInit(void) {

	_A_DEBUG << "AModifierService initiated";

	emit sgInitiated();
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCoreService::mLockBuffer(void* inPointer, size_t inSize) {

	mlock(inPointer,inSize);
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCoreService::mUnlockAndClear(void* inPointer, size_t inSize) {

	volatile char* oPointer = static_cast<volatile char*>(inPointer);
	while (inSize--) *oPointer++ = 0;
	std::atomic_thread_fence(std::memory_order_release);
	munlock(inPointer,inSize);
}

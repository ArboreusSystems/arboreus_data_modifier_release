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

	mMemoryClear();

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

	return QCryptographicHash::hash(pPassword,QCryptographicHash::Md5).left(16);
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

bool DMCoreService::mPasswordSet(const QString& inPassword) {

	mMemoryClear();

	QByteArray oPasswordBytes = inPassword.toUtf8();
	pPassword.resize(oPasswordBytes.size());
	mLockBuffer(pPassword.data(),pPassword.size());
	memcpy(pPassword.data(),oPasswordBytes.constData(),oPasswordBytes.size());

	// TODO: UniqueSaltInSettings
	QByteArray oSalt = QByteArray("TODO:UniqueSaltInSettings");

	pKey.resize(__KEY_SIZE);
	mLockBuffer(pKey.data(),pKey.size());

	int oResult = PKCS5_PBKDF2_HMAC(
		oPasswordBytes.constData(),
		static_cast<int>(oPasswordBytes.size()),
		reinterpret_cast<const unsigned char*>(oSalt.constData()),
		static_cast<int>(oSalt.size()),
		__PBKDF2_ITERATIONS,
		EVP_sha256(),
		__KEY_SIZE,
		reinterpret_cast<unsigned char*>(pKey.data())
	);

	mUnlockAndClear(oPasswordBytes.data(),oPasswordBytes.size());

	if (oResult != 1) {
		mMemoryClear();
		_A_CRITICAL << "PBKDF2 Derivation Failed!";
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

	return QString::fromUtf8(pPassword);
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
		mUnlockAndClear(pPassword.data(),pPassword.size());
		pPassword.clear();
	}

	if (!pKey.isEmpty()) {
		mUnlockAndClear(pKey.data(),pKey.size());
		pKey.clear();
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
	munlock(inPointer,inSize);
}

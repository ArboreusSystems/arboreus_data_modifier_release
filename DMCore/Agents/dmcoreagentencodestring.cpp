// ----------------------------------------------------------
/*!
	\class
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/01/2026 at 19:10:16
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "dmcoreagentencodestring.h"

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

DMCoreAgentEncodeString::DMCoreAgentEncodeString(QObject* parent) : AThreadAgentTemplate(parent) {

	pString = QString("");

	_A_DEBUG << "AModifierAgentEncodeString created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMCoreAgentEncodeString::~DMCoreAgentEncodeString(void) {

	mClear();

	_A_DEBUG << "AModifierAgentEncodeString deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCoreAgentEncodeString::slRun(void) {

	pOutput.pStatus = _A_ENUM_STATUS::Error;

	QByteArray oKeyBytes = pService->mKeyBytes();
	QByteArray oVectorBytes = pService->mVectorBytes();

	QByteArray oStringBytes = pString.toUtf8();
	oStringBytes.detach();

	AOutputQByteArray oEncodedOutput = pService->pDriver->mEncode(oStringBytes,oKeyBytes,oVectorBytes);
	if (oEncodedOutput.pStatus != _A_ENUM_STATUS::Ok) {
		pOutput.pStatus = oEncodedOutput.pStatus;
		pOutput.pCode = oEncodedOutput.pCode;
		pOutput.pValue = oEncodedOutput.pValue;
	} else {

		pOutput.pStatus = oEncodedOutput.pStatus;
		pOutput.pCode = oEncodedOutput.pCode;

		QString oBase64Result = QString::fromUtf8(oEncodedOutput.pValue.toBase64(
			QByteArray::Base64UrlEncoding | QByteArray::OmitTrailingEquals
		));
		oBase64Result.detach();
		pOutput.pValue = QVariant::fromValue(oBase64Result);
	}

	if (!oStringBytes.isEmpty()) {
		OPENSSL_cleanse(oStringBytes.data(), oStringBytes.size());
		oStringBytes.clear();
		oStringBytes.squeeze();
	}

	if (!oKeyBytes.isEmpty()) {
		OPENSSL_cleanse(oKeyBytes.data(), oKeyBytes.size());
		oKeyBytes.clear();
		oKeyBytes.squeeze();
	}

	if (!oVectorBytes.isEmpty()) {
		OPENSSL_cleanse(oVectorBytes.data(), oVectorBytes.size());
		oVectorBytes.clear();
		oVectorBytes.squeeze();
	}

	emit this->sgFinished();
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCoreAgentEncodeString::mClear(void) {

	if (&pString != &gDMCoreAgentEncodeString_EmptyString && !pString.isEmpty()) {

		QChar* pRawHeapData = pString.data();
		for (int i = 0; i < pString.length(); ++i) pRawHeapData[i] = QChar(0);
		pString.clear();
		pString.squeeze();
	}
}


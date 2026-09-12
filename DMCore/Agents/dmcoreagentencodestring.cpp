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

DMCoreAgentEncodeString::DMCoreAgentEncodeString(QObject* parent) : AThreadAgentTemplate{parent} {

	_A_DEBUG << "AModifierAgentEncodeString created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMCoreAgentEncodeString::~DMCoreAgentEncodeString(void) {

	_A_DEBUG << "AModifierAgentEncodeString deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCoreAgentEncodeString::slRun(void) {

	pOutput = AOutputQVariant();
	pOutput.pStatus = _A_ENUM_STATUS::Error;

	QByteArray oStringBytes = pString.toUtf8();
	QByteArray oKeyBytes = pService->mKeyBytes();
	QByteArray oVectorBytes = pService->mVectorBytes();

	AOutputQByteArray oEncodedOutput = pService->pDriver->mEncode(oStringBytes,oKeyBytes,oVectorBytes);
	if (oEncodedOutput.pStatus != _A_ENUM_STATUS::Ok) {
		pOutput.pStatus = oEncodedOutput.pStatus;
		pOutput.pCode = oEncodedOutput.pCode;
		pOutput.pValue = oEncodedOutput.pValue;
	} else {
		pOutput.pStatus = oEncodedOutput.pStatus;
		pOutput.pCode = oEncodedOutput.pCode;
		pOutput.pValue = QVariant::fromValue(QString(oEncodedOutput.pValue.toBase64(
			QByteArray::Base64UrlEncoding|QByteArray::OmitTrailingEquals
		)));
	}

	emit this->sgFinished();
}


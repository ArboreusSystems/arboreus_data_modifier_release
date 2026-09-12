// ----------------------------------------------------------
/*!
	\class AModifierAgentDecodeString
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/01/2026 at 19:13:04
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "dmcoreagentdecodestring.h"

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

DMCoreAgentDecodeString::DMCoreAgentDecodeString(QObject* parent) : AThreadAgentTemplate{parent} {

	_A_DEBUG << "AModifierAgentDecodeString created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMCoreAgentDecodeString::~DMCoreAgentDecodeString(void) {

	_A_DEBUG << "AModifierAgentDecodeString deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCoreAgentDecodeString::slRun(void) {

	pOutput = AOutputQVariant();
	pOutput.pStatus = _A_ENUM_STATUS::Error;

	QByteArray oKeyBytes = pService->mKeyBytes();
	QByteArray oVectorBytes = pService->mVectorBytes();
	QByteArray oEncodedBytes = QByteArray::fromBase64(
		pString.toUtf8(),QByteArray::Base64UrlEncoding|QByteArray::OmitTrailingEquals
	);

	AOutputQByteArray oDecodedOutput = pService->pDriver->mDecode(oEncodedBytes,oKeyBytes,oVectorBytes);
	if (oDecodedOutput.pStatus != _A_ENUM_STATUS::Ok) {
		pOutput.pStatus = oDecodedOutput.pStatus;
		pOutput.pCode = oDecodedOutput.pCode;
		pOutput.pValue = oDecodedOutput.pValue;
	} else {
		pOutput.pStatus = oDecodedOutput.pStatus;
		pOutput.pCode = oDecodedOutput.pCode;
		pOutput.pValue = QVariant::fromValue(QString(oDecodedOutput.pValue));
	}

	emit this->sgFinished();
}

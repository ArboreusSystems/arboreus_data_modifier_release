// ----------------------------------------------------------
/*!
	\class
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/09/2026 at 10:40:19
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "dmcoreagentispassworddefined.h"

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

DMCoreAgentIsPasswordDefined::DMCoreAgentIsPasswordDefined(QObject *parent) : AThreadAgentTemplate(parent) {

	_A_DEBUG << "AModifierAgentIsPasswordDefined created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMCoreAgentIsPasswordDefined::~DMCoreAgentIsPasswordDefined(void) {

	_A_DEBUG << "AModifierAgentIsPasswordDefined deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCoreAgentIsPasswordDefined::slRun(void) {

	pOutput.pStatus = _A_ENUM_STATUS::Ok;
	pOutput.pValue = pService->mIsPasswordDefined();

	emit this->sgFinished();
}

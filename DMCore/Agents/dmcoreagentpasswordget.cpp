// ----------------------------------------------------------
/*!
	\class AModifierAgentPasswordGet
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/09/2026 at 21:12:54
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "dmcoreagentpasswordget.h"

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

DMCoreAgentPasswordGet::DMCoreAgentPasswordGet(QObject* parent) : AThreadAgentTemplate(parent) {

	_A_DEBUG << "AModifierAgentPasswordGet created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMCoreAgentPasswordGet::~DMCoreAgentPasswordGet(void) {

	pOutput.pValue = QVariant::fromValue(0);

	_A_DEBUG << "AModifierAgentPasswordGet deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCoreAgentPasswordGet::slRun(void) {

	pOutput.pStatus = _A_ENUM_STATUS::Ok;
	pOutput.pValue = QVariant::fromValue(pService->mPasswordGet());

	emit this->sgFinished();
}

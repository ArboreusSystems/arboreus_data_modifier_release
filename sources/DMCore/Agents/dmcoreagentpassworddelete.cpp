// ----------------------------------------------------------
/*!
	\class
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/09/2026 at 11:41:24
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "dmcoreagentpassworddelete.h"

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

DMCoreAgentPasswordDelete::DMCoreAgentPasswordDelete(QObject* parent) : AThreadAgentTemplate(parent) {

	_A_DEBUG << "AModifierAgentPasswordDelete created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMCoreAgentPasswordDelete::~DMCoreAgentPasswordDelete(void) {

	_A_DEBUG << "AModifierAgentPasswordDelete deleted";
}

// -----------
/*!
	\fn

	Doc.
*/

void DMCoreAgentPasswordDelete::slRun(void) {

	pService->mPasswordDelete();
	pOutput.pStatus = _A_ENUM_STATUS::Ok;

	emit this->sgFinished();
}
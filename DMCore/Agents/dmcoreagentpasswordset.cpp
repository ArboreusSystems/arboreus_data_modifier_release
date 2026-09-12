// ----------------------------------------------------------
/*!
	\class AModifierAgentPasswordSet
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/09/2026 at 21:12:08
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "dmcoreagentpasswordset.h"

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

DMCoreAgentPasswordSet::DMCoreAgentPasswordSet(QObject *parent) : AThreadAgentTemplate{parent} {

	_A_DEBUG << "AModifierAgentPasswordSet created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMCoreAgentPasswordSet::~DMCoreAgentPasswordSet(void) {

	_A_DEBUG << "AModifierAgentPasswordSet deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMCoreAgentPasswordSet::slRun(void) {

	bool oResult = pService->mPasswordSet(pPassword);
	if (oResult) {
		pOutput.pStatus = _A_ENUM_STATUS::Ok;
	} else {
		pOutput.pStatus = _A_ENUM_STATUS::Error;
		_A_CRITICAL << "Can't set password";
	}
	pOutput.pValue = QVariant::fromValue(oResult);

	emit this->sgFinished();
}
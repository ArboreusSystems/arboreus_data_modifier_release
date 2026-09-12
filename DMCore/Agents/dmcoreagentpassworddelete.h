// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/09/2026 at 11:41:24
	\endlist
*/
// ----------------------------------------------------------
#ifndef DMCOREAGENTPASSWORDDELETE_H
#define DMCOREAGENTPASSWORDDELETE_H

// Precompiled includes
#include <dmcore_pch.h>

// System includes

// Application includes
#include <auniversaldefinitions.h>
#include <alogger.h>
#include <athreadagenttemplate.h>
#include <aoutputqvariant.h>
#include <dmcoreservice.h>
#include <dmcoredefinitions.h>

// Namesapces

// Constants and definitions

// Namesapces
namespace ARB {

// Class definitions
class DMCoreAgentPasswordDelete : public AThreadAgentTemplate {

	Q_OBJECT

	public:

		AOutputQVariant pOutput = AOutputQVariant();
		DMCoreService* pService = nullptr;

		explicit DMCoreAgentPasswordDelete(QObject* parent = nullptr);
		virtual ~DMCoreAgentPasswordDelete(void);

	public slots:

		void slRun(void);
};

} // namespace ARB

#endif // DMCOREAGENTPASSWORDDELETE_H

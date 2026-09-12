// ----------------------------------------------------------
/*!
	\headerfile AModifierAgentPasswordSet
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/09/2026 at 21:12:08
	\endlist
*/
// ----------------------------------------------------------
#ifndef DMCOREAGENTPASSWORDSET_H
#define DMCOREAGENTPASSWORDSET_H

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
class DMCoreAgentPasswordSet : public AThreadAgentTemplate {

	Q_OBJECT

	public:

		QString pPassword = "";
		AOutputQVariant pOutput = AOutputQVariant();
		DMCoreService* pService = nullptr;

		explicit DMCoreAgentPasswordSet(QObject* parent = nullptr);
		virtual ~DMCoreAgentPasswordSet(void);

	public slots:

		void slRun(void);
};

} // namespace ARB

#endif // DMCOREAGENTPASSWORDSET_H

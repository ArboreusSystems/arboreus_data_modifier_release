// ----------------------------------------------------------
/*!
	\headerfile AModifierAgentPasswordGet
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/09/2026 at 21:12:54
	\endlist
*/
// ----------------------------------------------------------
#ifndef DMCOREAGENTPASSWORDGET_H
#define DMCOREAGENTPASSWORDGET_H

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
class DMCoreAgentPasswordGet : public AThreadAgentTemplate {

	Q_OBJECT

	public:

		AOutputQVariant pOutput = AOutputQVariant();
		DMCoreService* pService = nullptr;

		explicit DMCoreAgentPasswordGet(QObject* parent = nullptr);
		virtual ~DMCoreAgentPasswordGet(void);

	public slots:

		void slRun(void);
};

} // namespace ARB

#endif // DMCOREAGENTPASSWORDGET_H

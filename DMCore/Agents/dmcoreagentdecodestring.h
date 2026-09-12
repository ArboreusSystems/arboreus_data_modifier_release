// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/01/2026 at 19:13:04
	\endlist
*/
// ----------------------------------------------------------
#ifndef DMCOREAGENTDECODESTRING_H
#define DMCOREAGENTDECODESTRING_H

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
class DMCoreAgentDecodeString : public AThreadAgentTemplate {

	Q_OBJECT

	public:

		QString pString = "";
		AOutputQVariant pOutput = AOutputQVariant();
		DMCoreService* pService = nullptr;

		explicit DMCoreAgentDecodeString(QObject* parent = nullptr);
		virtual ~DMCoreAgentDecodeString(void);

	public slots:

		void slRun(void);
};

} // namespace ARB

#endif // DMCOREAGENTDECODESTRING_H

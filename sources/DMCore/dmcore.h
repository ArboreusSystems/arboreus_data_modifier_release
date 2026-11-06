// ----------------------------------------------------------
/*!
	\headerfile AModifier
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/09/2025 at 15:07:38
	\endlist
*/
// ----------------------------------------------------------

#ifndef DMCORE_H
#define DMCORE_H

// Precompiled includes
#include <dmcore_pch.h>

// System includes

// Application includes
#include <alogger.h>
#include <athreadtemplate.h>
#include <athreadobjectcontrollertemplate.h>
#include <dmcoreservice.h>
#include <dmcoredefinitions.h>
#include <dmcoreagentencodestring.h>
#include <dmcoreagentdecodestring.h>
#include <dmcoreagentpasswordget.h>
#include <dmcoreagentpasswordset.h>
#include <dmcoreagentpassworddelete.h>
#include <dmcoreagentispassworddefined.h>

// Constants and definitions

// Namesapces
namespace ARB {

// Class definitions
class DMCore: public AThreadTemplate<DMCoreService> {

	Q_OBJECT

	public:

		explicit DMCore(QObject* parent = nullptr);
		virtual ~DMCore(void);

		void mInit(void);

	public slots:

		QVariantMap mIsPasswordDefined(void);
		QVariantMap mPasswordSet(const QJSValue& inPassword);
		QVariantMap mPasswordSetHandler(QString& inPassword);
		QVariantMap mPasswordGet(void);
		QVariantMap mPasswordDelete(void);
		QVariantMap mEncodeString(const QJSValue& inString);
		QVariantMap mEncodeStringHandler(QString& inString);
		QVariantMap mDecodeString(const QJSValue& inString);
		QVariantMap mDecodeStringHandler(QString& inString);
		void mClearOutput(QVariantMap inMap);

		void slInitiated(void);

	signals:

		void sgInit(void);
		void sgInitiated(void);
};

} // namespace ARB

#endif // DMCORE_H

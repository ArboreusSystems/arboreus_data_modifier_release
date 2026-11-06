// ----------------------------------------------------------
/*!
	\headerfile ALoggerAgentDefault
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 19/10/2025 at 16:11:01
	\endlist
*/
// ----------------------------------------------------------
#ifndef ALOGGERAGENTDEFAULT_H
#define ALOGGERAGENTDEFAULT_H

// Precompiled includes

// System includes

// Android system inclides
#ifdef Q_OS_ANDROID
#include <android/log.h>
#endif

// Application includes
#include <alogger.h>

// Constants and definitions

// Namesapces
namespace ARB {
namespace DM {

// Class definitions
class DMLoggerAgentDefault : public ALoggerAgent {

	Q_OBJECT

	public:

		explicit DMLoggerAgentDefault(QObject* parent = nullptr);
		virtual ~DMLoggerAgentDefault(void);

		void mWriteToLog(ALoggerMessageModel inMessage) override;
		static void mOnStopping(
			QtMsgType inType,
			const QMessageLogContext& inContext,
			const QString& inMessage
		);
		static void mWriteToConsole(ALoggerMessageModel inMessage);

	public slots:

		void slInit(ARB::ALoggerProperties* inProperties) override;
};

} // namespace DM
} // namespace ARB

#endif // ALOGGERAGENTDEFAULT_H

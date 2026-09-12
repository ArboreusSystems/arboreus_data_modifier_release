// ----------------------------------------------------------
/*!
	\class ALoggerAgentDefault
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 19/10/2025 at 16:11:01
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "dmloggeragentdefault.h"

// Namespace
using namespace ARB;
using namespace DM;

// Global variables
extern bool gLoggerStopping;


// -----------
/*!
	\fn

	Doc.
*/

DMLoggerAgentDefault::DMLoggerAgentDefault(QObject* parent) : ALoggerAgent(parent) {

	_A_DEBUG << "DMLoggerAgentDefault created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMLoggerAgentDefault::~DMLoggerAgentDefault(void) {

	gLoggerStopping = true;

	_A_DEBUG << "DMLoggerAgentDefault deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMLoggerAgentDefault::mWriteToLog(ALoggerMessageModel inMessage) {

	DMLoggerAgentDefault::mWriteToConsole(inMessage);
}


// -----------
/*!
	\fn

	Doc.
*/

void DMLoggerAgentDefault::mOnStopping(
	QtMsgType inType,
	const QMessageLogContext& inContext,
	const QString& inMessage
) {

	ALoggerMessageModel oMessage = ALogger::mCreateModel(inType,inContext,inMessage);
	DMLoggerAgentDefault::mWriteToConsole(oMessage);
}


// -----------
/*!
	\fn

	Doc.
*/


void DMLoggerAgentDefault::mWriteToConsole(ALoggerMessageModel inMessage) {

#ifdef Q_OS_ANDROID

#ifdef QT_DEBUG

	switch (inMessage.Type) {
		case QtDebugMsg:
			__android_log_print(
				ANDROID_LOG_DEBUG,_A_LOGGER_DEFAULT_STRING_DEBUG,
				"%s %llu %s %s [%s]:[%s]:[%u]\n",
				inMessage.Author,inMessage.Time,inMessage.ThreadID.constData(),
				inMessage.Message.constData(),inMessage.Function,inMessage.File,inMessage.Line
			);
			break;
		case QtInfoMsg:
			__android_log_print(
				ANDROID_LOG_INFO,_A_LOGGER_DEFAULT_STRING_INFO,
				"%s %llu %s %s [%s]:[%s]:[%u]\n",
				inMessage.Author,inMessage.Time,inMessage.ThreadID.constData(),
				inMessage.Message.constData(),inMessage.Function,inMessage.File,inMessage.Line
			);
			break;
		case QtWarningMsg:
			__android_log_print(
				ANDROID_LOG_WARN,_A_LOGGER_DEFAULT_STRING_WARNING,
				"%s %llu %s %s [%s]:[%s]:[%u]\n",
				inMessage.Author,inMessage.Time,inMessage.ThreadID.constData(),
				inMessage.Message.constData(),inMessage.Function,inMessage.File,inMessage.Line
			);
			break;
		case QtCriticalMsg:
			__android_log_print(
				ANDROID_LOG_ERROR,_A_LOGGER_DEFAULT_STRING_CRITICAL,
				"%s %llu %s %s [%s]:[%s]:[%u]\n",
				inMessage.Author,inMessage.Time,inMessage.ThreadID.constData(),
				inMessage.Message.constData(),inMessage.Function,inMessage.File,inMessage.Line
			);
			break;
		case QtFatalMsg:
			__android_log_print(
				ANDROID_LOG_FATAL,_A_LOGGER_DEFAULT_STRING_FATAL,
				"%s %llu %s %s [%s]:[%s]:[%u]\n",
				inMessage.Author,inMessage.Time,inMessage.ThreadID.constData(),
				inMessage.Message.constData(),inMessage.Function,inMessage.File,inMessage.Line
			);
			break;
		default:
			__android_log_print(
				ANDROID_LOG_UNKNOWN,_A_LOGGER_DEFAULT_STRING_UNDEFINED
				"%s %llu %s %s [%s]:[%s]:[%u]\n",
				inMessage.Author,inMessage.Time,inMessage.ThreadID.constData(),
				inMessage.Message.constData(),inMessage.Function,inMessage.File,inMessage.Line
			);
			break;
	}

#endif

#else

#ifdef QT_DEBUG

	switch (inMessage.Type) {
		case QtDebugMsg:
			fprintf(stderr,"%s:%s %llu %s %s [%s]:[%s]:[%u]\n",
				_A_LOGGER_DEFAULT_STRING_DEBUG,
				inMessage.Author,inMessage.Time,inMessage.ThreadID.constData(),
				inMessage.Message.constData(),inMessage.Function,inMessage.File,inMessage.Line
			);
			break;
		case QtInfoMsg:
			fprintf(stderr,"%s:%s %llu %s %s [%s]:[%s]:[%u]\n",
				_A_LOGGER_DEFAULT_STRING_INFO,
				inMessage.Author,inMessage.Time,inMessage.ThreadID.constData(),
				inMessage.Message.constData(),inMessage.Function,inMessage.File,inMessage.Line
			);
			break;
		case QtWarningMsg:
			fprintf(stderr,"%s:%s %llu %s %s [%s]:[%s]:[%u]\n",
				_A_LOGGER_DEFAULT_STRING_WARNING,
				inMessage.Author,inMessage.Time,inMessage.ThreadID.constData(),
				inMessage.Message.constData(),inMessage.Function,inMessage.File,inMessage.Line
			);
			break;
		case QtCriticalMsg:
			fprintf(stderr,"%s:%s %llu %s %s [%s]:[%s]:[%u]\n",
				_A_LOGGER_DEFAULT_STRING_CRITICAL,
				inMessage.Author,inMessage.Time,inMessage.ThreadID.constData(),
				inMessage.Message.constData(),inMessage.Function,inMessage.File,inMessage.Line
			);
			break;
		case QtFatalMsg:
			fprintf(stderr,"%s:%s %llu %s %s [%s]:[%s]:[%u]\n",
				_A_LOGGER_DEFAULT_STRING_FATAL,
				inMessage.Author,inMessage.Time,inMessage.ThreadID.constData(),
				inMessage.Message.constData(),inMessage.Function,inMessage.File,inMessage.Line
			);
			break;
		default:
			fprintf(stderr,"%s:%s %llu %s %s [%s]:[%s]:[%u]\n",
				_A_LOGGER_DEFAULT_STRING_UNDEFINED,
				inMessage.Author,inMessage.Time,inMessage.ThreadID.constData(),
				inMessage.Message.constData(),inMessage.Function,inMessage.File,inMessage.Line
			);
			break;
	}

#endif

#endif
}


// -----------
/*!
	\fn

	Doc.
*/

void DMLoggerAgentDefault::slInit(ALoggerProperties* inProperties) {

	_A_DEBUG << "DMLoggerAgentDefault initiated";

	emit sgInitiated();
}


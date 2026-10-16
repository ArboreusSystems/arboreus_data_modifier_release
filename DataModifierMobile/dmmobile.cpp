/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 31/01/2026 at 06:58:30
 * */// --------------------------------------------------------------

// Precompiled includes
#include <dmmobile_pch.h>

// System includes

// Application includes
#include <alogger.h>
#include <Config/dmconfig.h>
#include <dmbackend.h>

// Namesapce
using namespace ARB;
using namespace DM;

// Global variables
QObject* gConfig = nullptr;
QGuiApplication* gGuiApplication = nullptr;
QQmlApplicationEngine* gApplicationEngine = nullptr;
DMBackend* gBackend = nullptr;
extern ALogger* gLogger;
extern bool gLoggerStopping;


// Global functions
// -----------
/*!
	\fn

	Doc.
*/

static void __attribute__((unused)) fMain_MessageHandler(
	QtMsgType inType, const QMessageLogContext& inContext, const QString& inMessage
) {

	if (gLoggerStopping) {
		DMLoggerAgentDefault::mOnStopping(inType,inContext,inMessage);
	} else {
		ALogger::mMessageHandler(inType,inContext,inMessage);
	}
}


// Qt Quick Application
int main(int inCounter, char* inArguments[]) {

	qputenv("QSG_RENDER_LOOP","basic");

	QGuiApplication oGUIApplicationObject(inCounter,inArguments);
	QGuiApplication* oGuiApplication = &oGUIApplicationObject;
	gGuiApplication = oGuiApplication;

	QQuickStyle::setStyle("Basic");

	QQmlApplicationEngine oApplicationEngineObject;
	QQmlApplicationEngine* oApplicationEngine = &oApplicationEngineObject;
	gApplicationEngine = oApplicationEngine;

	qInstallMessageHandler(fMain_MessageHandler);

	DMConfig* oConfig = new DMConfig(oApplicationEngine);
	oConfig->mInit();
	gConfig = oConfig;

	oConfig->AApplicationConfig_Lifecycle_WillLaunchBackend();
	AThreadObjectControllerTemplate* oController = new AThreadObjectControllerTemplate();
	QEventLoop* oEventLoop = new QEventLoop();

	DMBackend* oBackend = &DMBackend::mInstance();
	gBackend = oBackend;
	QObject::connect(
		oController,&AThreadObjectControllerTemplate::sgRun,
		oBackend,[oBackend,oGuiApplication,oApplicationEngine,oConfig](){
			oBackend->mInit(
				oGuiApplication,
				oApplicationEngine,
				oApplicationEngine->rootContext(),
				static_cast<QObject*>(oConfig)
			);
		},
		Qt::QueuedConnection
	);
	QObject::connect(
		oBackend,&DMBackend::sgInitiated,
		oEventLoop,&QEventLoop::quit
	);

	emit oController->sgRun();
	oEventLoop->exec();

	QObject::disconnect(oController,nullptr,nullptr,nullptr);
	QObject::disconnect(oBackend,nullptr,oEventLoop,nullptr);
	delete oController;
	delete oEventLoop;
	oConfig->AApplicationConfig_Lifecycle_DidLaunchBackend();

	oConfig->AApplicationConfig_Lifecycle_WillLaunchUI();
	QObject::connect(
		oApplicationEngine,&QQmlApplicationEngine::objectCreationFailed,
		oGuiApplication,[]() {
			QCoreApplication::exit(-1);
		},
		Qt::QueuedConnection
	);
	oApplicationEngine->loadFromModule("UIDataModifierMobile","DMMainWindow");
	oConfig->AApplicationConfig_Lifecycle_DidLaunchUI();

	int oExecutionResult = oGuiApplication->exec();
	oConfig->AApplicationConfig_Lifecycle_WillQuit();

	return oExecutionResult;
}

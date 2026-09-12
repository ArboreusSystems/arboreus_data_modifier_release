// ----------------------------------------------------------
/*!
	\class ABackend
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/09/2025 at 15:16:29
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "dmbackend.h"

// Namespace
using namespace ARB;
using namespace DM;


// -----------
/*!
	\fn

	Doc.
*/

DMBackend::DMBackend(QObject* parent) : QObject(parent) {

	pApplication = new AApplication(this);
	pLogger = &ALogger::mInstance();
	pSettings = new ASettings(this);
	pUIHandler = new AUIHandler(this);
	pDevice = new ADevice(this);
	pClipboard = new AClipboard(this);

	pCore = new DMCore(this);

	_A_DEBUG << "DMBackend created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMBackend::~DMBackend(void) {

	_A_DEBUG << "DMBackend deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

DMBackend& DMBackend::mInstance(void) {

	static DMBackend oInstance;
	return oInstance;
}


// -----------
/*!
	\fn

	Doc.
*/

void DMBackend::mInit(
	QGuiApplication* inGuiApplication,
	QQmlApplicationEngine* inEngine,
	QQmlContext* inRootContext,
	QObject* inGlobalConfig
) {

	if (inGuiApplication) {
		pGuiApplication = inGuiApplication;
	}
	if (inEngine) {
		pEngine = inEngine;
	}
	if (inRootContext) {
		pRootContext = inRootContext;
		pRootContext->setContextProperty("DMBackend",this);
	}
	if (inGlobalConfig) {
		pGlobalConfig = inGlobalConfig;
		pBackendConfig = qobject_cast<DMBackendConfig*>(pGlobalConfig);
	}

	mInitMetaTypes();
	mInitApplication();
	mInitLogger();
	mInitSettings();
	mInitUIHandler();
	mInitCore();
	mInitDevice();
	mInitClipboard();

	_A_DEBUG << "DMBackend initiated";

	emit sgInitiated();
}


// -----------
/*!
	\fn

	Doc.
*/

void DMBackend::mInitMetaTypes(void) {

	qmlRegisterUncreatableMetaObject(_A_META_UNIVERSAL_ENUM_STATUS);
	qmlRegisterUncreatableMetaObject(_A_META_DEVICE_ENUM_DEVICE_TYPE);
	qmlRegisterUncreatableMetaObject(_A_META_DEVICE_ENUM_PLATFORM);
	qmlRegisterUncreatableMetaObject(_A_META_DEVICE_ENUM_STATUS_BAR_STYLE);
}


// -----------
/*!
	\fn

	Doc.
*/

void DMBackend::mInitApplication(void) {

	AThreadObjectControllerTemplate* oController = new AThreadObjectControllerTemplate();
	QEventLoop* oEventLoop = new QEventLoop();

	QObject::connect(
		oController,&AThreadObjectControllerTemplate::sgRun,
		pApplication,[this](){
			pApplication->mInit(pGlobalConfig);
		},
		Qt::QueuedConnection
	);
	QObject::connect(
		pApplication,&AApplication::sgInitiated,
		oEventLoop,&QEventLoop::quit,
		Qt::QueuedConnection
	);

	emit oController->sgRun();
	oEventLoop->exec();

	QObject::disconnect(oController,nullptr,nullptr,nullptr);
	QObject::disconnect(pApplication,nullptr,oEventLoop,nullptr);

	pRootContext->setContextProperty("AApplication",pApplication);
	pRootContext->setContextProperty("AVariables",pApplication->pVariables);
	pRootContext->setContextProperty("ATranslator",pApplication->pTranslator);
}


// -----------
/*!
	\fn

	Doc.
*/

void DMBackend::mInitLogger(void) {

	AThreadObjectControllerTemplate* oController = new AThreadObjectControllerTemplate();
	QEventLoop* oEventLoop = new QEventLoop();

	ALoggerProperties* oLoggerProperties = new ALoggerProperties();
	oLoggerProperties->Agent = new DMLoggerAgentDefault();

	QObject::connect(
		oController,&AThreadObjectControllerTemplate::sgRun,
		pLogger,[this,oLoggerProperties](){
			pLogger->mInit(oLoggerProperties);
		},
		Qt::QueuedConnection
	);
	QObject::connect(
		pLogger,&ALogger::sgInitiated,
		oEventLoop,&QEventLoop::quit,
		Qt::QueuedConnection
	);

	emit oController->sgRun();
	oEventLoop->exec();

	QObject::disconnect(oController,nullptr,nullptr,nullptr);
	QObject::disconnect(pLogger,nullptr,oEventLoop,nullptr);

	pRootContext->setContextProperty("ALogger",pLogger);
}


// -----------
/*!
	\fn

	Doc.
*/

void DMBackend::mInitSettings(void) {

	AThreadObjectControllerTemplate* oController = new AThreadObjectControllerTemplate();
	QEventLoop* oEventLoop = new QEventLoop();

	QObject::connect(
		oController,&AThreadObjectControllerTemplate::sgRun,
		pSettings,[this](){
			DMSettingsDriver* oDriver = new DMSettingsDriver(
				this->pApplication->pPath->mPathDataApplication()
			);
			pSettings->mInit(oDriver);
			pApplication->pTranslator->mLocaleSet(
				qvariant_cast<QString>(pSettings->mGetValue("Locale"))
			);
		},
		Qt::QueuedConnection
	);
	QObject::connect(
		pSettings,&ASettings::sgInitiated,
		oEventLoop,&QEventLoop::quit,
		Qt::QueuedConnection
	);

	emit oController->sgRun();
	oEventLoop->exec();

	QObject::disconnect(oController,nullptr,nullptr,nullptr);
	QObject::disconnect(pSettings,nullptr,oEventLoop,nullptr);

	pRootContext->setContextProperty("ASettings",pSettings);
}


// -----------
/*!
	\fn

	Doc.
*/

void DMBackend::mInitUIHandler(void) {

	AThreadObjectControllerTemplate* oController = new AThreadObjectControllerTemplate();
	QEventLoop* oEventLoop = new QEventLoop();

	QObject::connect(
		oController,&AThreadObjectControllerTemplate::sgRun,
		pUIHandler,[this](){
			pUIHandler->mInit(pGlobalConfig);
		},
		Qt::QueuedConnection
	);
	QObject::connect(
		pUIHandler,&AUIHandler::sgInitiated,
		oEventLoop,&QEventLoop::quit,
		Qt::QueuedConnection
	);

	emit oController->sgRun();
	oEventLoop->exec();

	QObject::disconnect(oController,nullptr,nullptr,nullptr);
	QObject::disconnect(pUIHandler,nullptr,oEventLoop,nullptr);

	pRootContext->setContextProperty("AUIHandler",pUIHandler);
	pRootContext->setContextProperty("AUIConfig",pUIHandler->pUIConfig);
	pRootContext->setContextProperty("AColors",pUIHandler->pColors);
	pRootContext->setContextProperty("AFonts",pUIHandler->pFonts);
}


// -----------
/*!
	\fn

	Doc.
*/

void DMBackend::mInitCore(void) {

	AThreadObjectControllerTemplate* oController = new AThreadObjectControllerTemplate();
	QEventLoop* oEventLoop = new QEventLoop();

	QObject::connect(
		oController,&AThreadObjectControllerTemplate::sgRun,
		pCore,[this](){
			pCore->mInit();
		},
		Qt::QueuedConnection
	);
	QObject::connect(
		pCore,&DMCore::sgInitiated,
		oEventLoop,&QEventLoop::quit,
		Qt::QueuedConnection
	);

	emit oController->sgRun();
	oEventLoop->exec();

	QObject::disconnect(oController,nullptr,nullptr,nullptr);
	QObject::disconnect(pCore,nullptr,oEventLoop,nullptr);

	pRootContext->setContextProperty("DMCore",pCore);
}


// -----------
/*!
	\fn

	Doc.
*/

void DMBackend::mInitDevice(void) {

	AThreadObjectControllerTemplate* oController = new AThreadObjectControllerTemplate();
	QEventLoop* oEventLoop = new QEventLoop();

	QObject::connect(
		oController,&AThreadObjectControllerTemplate::sgRun,
		pDevice,[this](){
			pDevice->mInit();
		},
		Qt::QueuedConnection
	);
	QObject::connect(
		pDevice,&ADevice::sgInitiated,
		oEventLoop,&QEventLoop::quit,
		Qt::QueuedConnection
	);

	emit oController->sgRun();
	oEventLoop->exec();

	QObject::disconnect(oController,nullptr,nullptr,nullptr);
	QObject::disconnect(pDevice,nullptr,oEventLoop,nullptr);

	pRootContext->setContextProperty("ADevice",pDevice);
	pRootContext->setContextProperty("AKeyboard",pDevice->pKeyboard);
}


// -----------
/*!
	\fn

	Doc.
*/

void DMBackend::mInitClipboard(void) {

	AThreadObjectControllerTemplate* oController = new AThreadObjectControllerTemplate();
	QEventLoop* oEventLoop = new QEventLoop();

	QObject::connect(
		oController,&AThreadObjectControllerTemplate::sgRun,
		pClipboard,[this](){
			pClipboard->mInit();
		},
		Qt::QueuedConnection
	);
	QObject::connect(
		pClipboard,&AClipboard::sgInitiated,
		oEventLoop,&QEventLoop::quit,
		Qt::QueuedConnection
	);

	emit oController->sgRun();
	oEventLoop->exec();

	QObject::disconnect(oController,nullptr,nullptr,nullptr);
	QObject::disconnect(pClipboard,nullptr,oEventLoop,nullptr);

	pRootContext->setContextProperty("AClipboard",pClipboard);
}

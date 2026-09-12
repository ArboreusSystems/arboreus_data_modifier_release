// ----------------------------------------------------------
/*!
	\headerfile ABackend
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/09/2025 at 15:16:29
	\endlist
*/
// ----------------------------------------------------------
#ifndef ABACKEND_H
#define ABACKEND_H

// Precompiled includes
#include <dmmobile_pch.h>

// System includes

// Application includes
#include <Backend/dmbackendconfig.h>
#include <Logger/dmloggeragentdefault.h>
#include <Settings/dmsettingsdriver.h>
#include <athreadobjectcontrollertemplate.h>
#include <alogger.h>
#include <aapplication.h>
#include <asettings.h>
#include <auniversalmetatypes.h>
#include <auihandler.h>
#include <adevice.h>
#include <aclipboard.h>
#include <atexteditmobile.h>
#include <atextinputmobile.h>
#include <dmcore.h>

// Constants and definitions

// Namesapces
namespace ARB {
namespace DM {

// Class definitions
class DMBackend : public QObject {

	Q_OBJECT

	public:

		ALogger* pLogger = nullptr;
		AApplication* pApplication = nullptr;
		ASettings* pSettings = nullptr;
		AUIHandler* pUIHandler = nullptr;
		ADevice* pDevice = nullptr;
		AClipboard* pClipboard = nullptr;

		DMCore* pCore = nullptr;

		QGuiApplication* pGuiApplication = nullptr;
		QQmlApplicationEngine* pEngine = nullptr;
		QQmlContext* pRootContext = nullptr;
		QScreen* pScreen = nullptr;

		static DMBackend& mInstance(void);
		void mInit(
			QGuiApplication* inGuiApplication = nullptr,
			QQmlApplicationEngine* inEngine = nullptr,
			QQmlContext* inRootContext = nullptr,
			QObject* inGlobalConfig = nullptr
		);

	signals:

		void sgInitiated(void);

	private:

		QObject* pGlobalConfig = nullptr;
		DMBackendConfig* pBackendConfig = nullptr;

		explicit DMBackend(QObject* parent = nullptr);
		virtual ~DMBackend(void);
		Q_DISABLE_COPY(DMBackend)

		void mInitMetaTypes(void);
		void mInitApplication(void);
		void mInitSettings(void);
		void mInitLogger(void);
		void mInitUIHandler(void);
		void mInitCore(void);
		void mInitDevice(void);
		void mInitClipboard(void);
};

} // namespace DM
} // namespace ARB

#endif // ABACKEND_H

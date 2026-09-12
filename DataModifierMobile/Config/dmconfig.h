// ----------------------------------------------------------
/*!
	\headerfile AConfig
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/09/2025 at 15:17:11
	\endlist
*/
// ----------------------------------------------------------
#ifndef ACONFIG_H
#define ACONFIG_H

// Precompiled includes
#include <dmmobile_pch.h>

// System includes

// System includes

// Application includes
#include <Config/dmconfigglobal.h>
#include <Backend/dmbackendconfig.h>
#include <aapplicationconfig.h>
#include <auihandlerconfig.h>
#include <adeviceconfig.h>
#include <aloggerdefinitions.h>
#include <atemplatesmetatypes.h>

// Constants and definitions

// Namesapces
namespace ARB {
namespace DM {

// Class definitions
class DMConfig :
	public QObject,
	public DMBackendConfig,
	public AApplicationConfig,
	public ADeviceConfig,
	public AUIHandlerConfig {

	Q_OBJECT
	Q_INTERFACES(
		ARB::DM::DMBackendConfig
		ARB::AApplicationConfig
		ARB::ADeviceConfig
		ARB::AUIHandlerConfig
	)

	public:

		explicit DMConfig(QObject* parent = nullptr);
		virtual ~DMConfig(void);

		void mInit(void);


	// ----------------------------
	// ABackendConfig

	public:

		const char* ABackendConfig_NameApplicationComponent(void);

	private:

		const char* pABackendConfig_NameApplicationComponent = "Arboreus";


	// ----------------------------
	// AApplicationConfig

	public:

		QThread::Priority AApplicationConfig_Application_ThreadPriority(void);
		QString AApplicationConfig_Application_Organisation(void);
		QString AApplicationConfig_Application_Name(void);

		QString AApplicationConfig_Registry_Value(void);
		QString AApplicationConfig_Registry_Salt(void);

		void AApplicationConfig_Lifecycle_WillLaunchBackend(void);
		void AApplicationConfig_Lifecycle_DidLaunchBackend(void);
		void AApplicationConfig_Lifecycle_WillLaunchUI(void);
		void AApplicationConfig_Lifecycle_DidLaunchUI(void);
		void AApplicationConfig_Lifecycle_WillQuit(void);

#if defined(Q_OS_IOS)

		void AApplicationConfig_IOSLifecycle_DidBecomeActive(void);
		void AApplicationConfig_IOSLifecycle_WillResignActive(void);
		void AApplicationConfig_IOSLifecycle_DidReceiveMemoryWarning(void);
		void AApplicationConfig_IOSLifecycle_WillTerminate(void);
		void AApplicationConfig_IOSLifecycle_SignificantTimeChange(void);
		void AApplicationConfig_IOSLifecycle_DidRegisterForRemoteNotificationsWithDeviceToken(QByteArray inToken);
		void AApplicationConfig_IOSLifecycle_DidFailToRegisterForRemoteNotificationsWithError(void);
		void AApplicationConfig_IOSLifecycle_DidUpdateUserActivity(void);
		void AApplicationConfig_IOSLifecycle_DidEnterBackground(void);
		void AApplicationConfig_IOSLifecycle_WillEnterForeground(void);

#endif

		void AApplicationConfig_Heartbeat_OnBeat(void);
		int AApplicationConfig_Heartbeat_DefaultTime(void);
		bool AApplicationConfig_Heartbeat_DefaultAutostart(void);

		QVariantList AApplicationConfig_Translator_LocaleList(void);
		QString AApplicationConfig_Translator_LocaleDefault(void);
		QString AApplicationConfig_Translator_ResourceName(void);

	private:

		QThread::Priority pAApplicationConfig_Application_ThreadPriority = QThread::Priority::LowPriority;
		QString pAAplication_Application_Name = "DataModifier";

		int pAApplicationConfig_Heartbeat_DefaultTime = 1000;
		bool pAApplicationConfig_Heartbeat_DefaultAutostart = false;
		QVariantList pAApplicationConfig_Translator_LocaleList = {"en","es","pt","ru","fr"};
		QString pAApplicationConfig_Translator_LocaleDefault = "en";
		QString pAApplicationConfig_Translator_ResourceName = ":/Translations/DataModifier_%1.qm";


	// ----------------------------
	// ADeviceConfig

	public:

		QString ADeviceConfig_NameApplicationComponent(void);
		_A_ENUM_DEVICE_STATUS_BAR_STYLE ADeviceConfig_StatusBarStyle(void);


	// ----------------------------
	// AUIHandlerConfig

	public:

		int AUIHandlerConfig_UIWidth(void);
		int AUIHandlerConfig_UIHeight(void);
		int AUIHandlerConfig_DesktopUIWidth(void);
		int AUIHandlerConfig_DesktopUIHeight(void);

		int AUIHandlerConfig_FontSizeHeader(void);
		int AUIHandlerConfig_FontSizeRegular(void);
		int AUIHandlerConfig_FontSizeTextInput(void);

		int AUIHandlerConfig_BorderSize(void);
		int AUIHandlerConfig_Radius(void);

		int AUIHandlerConfig_ElementHeight(void);

		QMap<QString,QString> AUIHandlerConfig_Colors(void);
		QList<QString> AUIHandlerConfig_Fonts(void);

	private:

		int pAUIHandlerConfig_UIWidth = 1440;
		int pAUIHandlerConfig_UIHeight = 2560;
		int pAUIHandlerConfig_DesktopUIWidth = 504;
		int pAUIHandlerConfig_DesktopUIHeight = 896;

		int pAUIHandlerConfig_FontSizeHeader = 22;
		int pAUIHandlerConfig_FontSizeRegular = 18;
		int pAUIHandlerConfig_FontSizeTextInput = 14;

		int pAUIHandlerConfig_BorderSize = 1;
		int pAUIHandlerConfig_Radius = 5;
		int pAUIHandlerConfig_ElementHeight = 40;

		QMap<QString,QString> pAUIHandlerConfig_Colors = {};
		QList<QString> pAUIHandlerConfig_Fonts = {};

		void mInit_AUIHandlerConfig_Colors(void);
		void mInit_AUIHandlerConfig_Fonts(void);
};

} // namespace DM
} // namespace ARB

#endif // ACONFIG_H

// ----------------------------------------------------------
/*!
	\class AConfig
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/09/2025 at 15:17:11
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "dmconfig.h"

// Forwarded headers
#include <dmbackend.h>

// Namespace
using namespace ARB;
using namespace DM;

// Global variables
extern DMBackend* gBackend;


// -----------
/*!
	\fn

	Doc.
*/

DMConfig::DMConfig(QObject* parent) : QObject{parent} {

	_A_DEBUG << "DMConfig created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMConfig::~DMConfig(void) {

	_A_DEBUG << "DMConfig deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::mInit(void) {

	mInit_AUIHandlerConfig_Colors();
	mInit_AUIHandlerConfig_Fonts();

	_A_DEBUG << "Config initiated";
}


// -----------
/*!
	\fn

	Doc.
*/

const char* DMConfig::ABackendConfig_NameApplicationComponent(void) {

	return pABackendConfig_NameApplicationComponent;
}


// -----------
/*!
	\fn

	Doc.
*/

QThread::Priority DMConfig::AApplicationConfig_Application_ThreadPriority(void) {

	return pAApplicationConfig_Application_ThreadPriority;
}


// -----------
/*!
	\fn

	Doc.
*/

QString DMConfig::AApplicationConfig_Application_Organisation(void) {

	return QString::fromUtf8(pABackendConfig_NameApplicationComponent);
}


// -----------
/*!
	\fn

	Doc.
*/

QString DMConfig::AApplicationConfig_Application_Name(void) {

	return pAAplication_Application_Name;
}


// -----------
/*!
	\fn

	Doc.
*/

QString DMConfig::AApplicationConfig_Application_VersionFull(void) {

	return pAApplicationConfig_Application_VersionFull;
}


// -----------
/*!
	\fn

	Doc.
*/

QString DMConfig::AApplicationConfig_Application_VersionShort(void) {

	return pAApplicationConfig_Application_VersionShort;
}


// -----------
/*!
	\fn

	Doc.
*/

QString DMConfig::AApplicationConfig_Application_VersionCode(void) {

	return pAApplicationConfig_Application_VersionCode;
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_Lifecycle_WillLaunchBackend(void) {

	ATemplatesMetatypes::mInit();

	_A_DEBUG << "AApplicationConfig_Lifecycle_WillLaunchBackend";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_Lifecycle_DidLaunchBackend(void) {

	_A_DEBUG << "AApplicationConfig_Lifecycle_DidLaunchBackend";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_Lifecycle_WillLaunchUI(void) {

	_A_DEBUG << "AApplicationConfig_Lifecycle_WillLaunchUI";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_Lifecycle_DidLaunchUI(void) {

	gBackend->pPrivacy->mScreen(
		gBackend->pSettings->mGetValue("SwitchScreenPrivacy").toBool()
	);

	_A_DEBUG << "AApplicationConfig_Lifecycle_DidLaunchUI";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_Lifecycle_WillQuit(void) {

	_A_DEBUG << "AApplicationConfig_Lifecycle_WillQuit";
}


#ifdef Q_OS_IOS

// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_IOSLifecycle_DidBecomeActive(void) {

	_A_DEBUG << "AApplicationConfig_IOSLifecycle_DidBecomeActive";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_IOSLifecycle_WillResignActive(void) {

	_A_DEBUG << "AApplicationConfig_IOSLifecycle_WillResignActive";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_IOSLifecycle_DidReceiveMemoryWarning(void) {

	_A_DEBUG << "AApplicationConfig_IOSLifecycle_DidReceiveMemoryWarning";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_IOSLifecycle_WillTerminate(void) {

	_A_DEBUG << "AApplicationConfig_IOSLifecycle_WillTerminate";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_IOSLifecycle_SignificantTimeChange(void) {

	_A_DEBUG << "AApplicationConfig_IOSLifecycle_SignificantTimeChange";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_IOSLifecycle_DidRegisterForRemoteNotificationsWithDeviceToken(QByteArray inToken) {

	Q_UNUSED(inToken)

	_A_DEBUG << "AApplicationConfig_IOSLifecycle_DidRegisterForRemoteNotificationsWithDeviceToken";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_IOSLifecycle_DidFailToRegisterForRemoteNotificationsWithError(void) {

	_A_DEBUG << "AApplicationConfig_IOSLifecycle_DidFailToRegisterForRemoteNotificationsWithError";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_IOSLifecycle_DidUpdateUserActivity(void) {

	_A_DEBUG << "AApplicationConfig_IOSLifecycle_DidUpdateUserActivity";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_IOSLifecycle_DidEnterBackground(void) {

	_A_DEBUG << "AApplicationConfig_IOSLifecycle_DidEnterBackground";
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_IOSLifecycle_WillEnterForeground(void) {

	_A_DEBUG << "AApplicationConfig_IOSLifecycle_WillEnterForeground";
}

#endif // ifdef Q_OS_IOS


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::AApplicationConfig_Heartbeat_OnBeat(void) {

	_A_DEBUG << "AApplicationConfig_Heartbeat_OnBeat";
}


// -----------
/*!
	\fn

	Doc.
*/

int DMConfig::AApplicationConfig_Heartbeat_DefaultTime(void) {

	return pAApplicationConfig_Heartbeat_DefaultTime;
}


// -----------
/*!
	\fn

	Doc.
*/

bool DMConfig::AApplicationConfig_Heartbeat_DefaultAutostart(void) {

	return pAApplicationConfig_Heartbeat_DefaultAutostart;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantList DMConfig::AApplicationConfig_Translator_LocaleList(void) {

	return pAApplicationConfig_Translator_LocaleList;
}


// -----------
/*!
	\fn

	Doc.
*/

QString DMConfig::AApplicationConfig_Translator_LocaleDefault(void) {

	return pAApplicationConfig_Translator_LocaleDefault;
}


// -----------
/*!
	\fn

	Doc.
*/

QString DMConfig::AApplicationConfig_Translator_ResourceName(void) {

	return pAApplicationConfig_Translator_ResourceName;
}


// -----------
/*!
	\fn

	Doc.
*/

QString DMConfig::ADeviceConfig_NameApplicationComponent(void) {

	return QString(pABackendConfig_NameApplicationComponent);
}


// -----------
/*!
	\fn

	Doc.
*/

_A_ENUM_DEVICE_STATUS_BAR_STYLE DMConfig::ADeviceConfig_StatusBarStyle(void) {

	return _A_ENUM_DEVICE_STATUS_BAR_STYLE::Light;
}


// -----------
/*!
	\fn

	Doc.
*/

int DMConfig::AUIHandlerConfig_UIWidth(void) {

	return pAUIHandlerConfig_UIWidth;
}


// -----------
/*!
	\fn

	Doc.
*/

int DMConfig::AUIHandlerConfig_UIHeight(void) {

	return pAUIHandlerConfig_UIHeight;
}


// -----------
/*!
	\fn

	Doc.
*/
int DMConfig::AUIHandlerConfig_DesktopUIWidth(void) {

	return pAUIHandlerConfig_DesktopUIWidth;
}


// -----------
/*!
	\fn

	Doc.
*/

int DMConfig::AUIHandlerConfig_DesktopUIHeight(void) {

	return pAUIHandlerConfig_DesktopUIHeight;
}


// -----------
/*!
	\fn

	Doc.
*/

int DMConfig::AUIHandlerConfig_FontSizeHeader(void) {

	return pAUIHandlerConfig_FontSizeHeader;
}


// -----------
/*!
	\fn

	Doc.
*/

int DMConfig::AUIHandlerConfig_FontSizeRegular(void) {

	return pAUIHandlerConfig_FontSizeRegular;
}


// -----------
/*!
	\fn

	Doc.
*/

int DMConfig::AUIHandlerConfig_FontSizeTextInput(void) {

	return pAUIHandlerConfig_FontSizeTextInput;
}


// -----------
/*!
	\fn

	Doc.
*/

int DMConfig::AUIHandlerConfig_BorderSize(void) {

	return pAUIHandlerConfig_BorderSize;
}


// -----------
/*!
	\fn

	Doc.
*/

int DMConfig::AUIHandlerConfig_Radius(void) {

	return pAUIHandlerConfig_Radius;
}


// -----------
/*!
	\fn

	Doc.
*/

int DMConfig::AUIHandlerConfig_ElementHeight(void) {

	return pAUIHandlerConfig_ElementHeight;
}


// -----------
/*!
	\fn

	Doc.
*/

QMap<QString,QString> DMConfig::AUIHandlerConfig_Colors(void) {

	return pAUIHandlerConfig_Colors;
}


// -----------
/*!
	\fn

	Doc.
*/

QList<QString> DMConfig::AUIHandlerConfig_Fonts(void) {

	return pAUIHandlerConfig_Fonts;
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::mInit_AUIHandlerConfig_Colors(void) {

	pAUIHandlerConfig_Colors.insert("BlackDarkest","#000000");
	pAUIHandlerConfig_Colors.insert("BlackDark","#080808");
	pAUIHandlerConfig_Colors.insert("Black","#161616");
	pAUIHandlerConfig_Colors.insert("BlackLight","#242424");

	pAUIHandlerConfig_Colors.insert("WhiteDark","#f4f4f4");
	pAUIHandlerConfig_Colors.insert("White","#f8f8f8");
	pAUIHandlerConfig_Colors.insert("WhiteLight","#ffffff");

	pAUIHandlerConfig_Colors.insert("GreyDarkest","#666666");
	pAUIHandlerConfig_Colors.insert("GreyDark","#BCBEC0");
	pAUIHandlerConfig_Colors.insert("Grey","#D2D3D4");
	pAUIHandlerConfig_Colors.insert("GreyLight","#E6E7E8");

	pAUIHandlerConfig_Colors.insert("FuchsiaDark","#d60586");
	pAUIHandlerConfig_Colors.insert("Fuchsia","#e80a89");
	pAUIHandlerConfig_Colors.insert("FuchsiaLight","#f20a9a");

	pAUIHandlerConfig_Colors.insert("PurpleDark","#7b0082");
	pAUIHandlerConfig_Colors.insert("Purple","#920596");
	pAUIHandlerConfig_Colors.insert("PurpleLight","#a605af");

	pAUIHandlerConfig_Colors.insert("RedDark","#db3531");
	pAUIHandlerConfig_Colors.insert("Red","#ee4037");
	pAUIHandlerConfig_Colors.insert("RedLight","#f93732");

	pAUIHandlerConfig_Colors.insert("RedWineDark","#af1426");
	pAUIHandlerConfig_Colors.insert("RedWine","#bc202e");
	pAUIHandlerConfig_Colors.insert("RedWineLight","#c9142b");

	pAUIHandlerConfig_Colors.insert("GreenDark","#007f39");
	pAUIHandlerConfig_Colors.insert("Green","#009247");
	pAUIHandlerConfig_Colors.insert("GreenLight","#00a048");

	pAUIHandlerConfig_Colors.insert("BlueDark","#133fa0");
	pAUIHandlerConfig_Colors.insert("Blue","#244bb5");
	pAUIHandlerConfig_Colors.insert("BlueLight","#2756c1");

	pAUIHandlerConfig_Colors.insert("SaladDark","#539000");
	pAUIHandlerConfig_Colors.insert("Salad","#66a511");
	pAUIHandlerConfig_Colors.insert("SaladLight","#92da2f");

	pAUIHandlerConfig_Colors.insert("DeepBlueDark","#192684");
	pAUIHandlerConfig_Colors.insert("DeepBlue","#2b3383");
	pAUIHandlerConfig_Colors.insert("DeepBlueLight","#2b3793");

	pAUIHandlerConfig_Colors.insert("OrangeDark","#f48414");
	pAUIHandlerConfig_Colors.insert("Orange","#f69220");
	pAUIHandlerConfig_Colors.insert("OrangeLight","#ff9831");

	pAUIHandlerConfig_Colors.insert("LavandaSuperDark","#9d9dce");
	pAUIHandlerConfig_Colors.insert("LavandaDarkest","#b5b5d5");
	pAUIHandlerConfig_Colors.insert("LavandaDark","#cacae8");
	pAUIHandlerConfig_Colors.insert("Lavanda","#dadaef");
	pAUIHandlerConfig_Colors.insert("LavandaLight","#efeff9");

	pAUIHandlerConfig_Colors.insert("CreamDark","#e5e0b1");
	pAUIHandlerConfig_Colors.insert("Cream","#ede9c5");
	pAUIHandlerConfig_Colors.insert("CreamLight","#f2f0d6");
}


// -----------
/*!
	\fn

	Doc.
*/

void DMConfig::mInit_AUIHandlerConfig_Fonts(void) {

	pAUIHandlerConfig_Fonts = {
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-Black.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-BlackItalic.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-Bold.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-BoldItalic.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-ExtraBold.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-ExtraBoldItalic.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-ExtraLight.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-ExtraLightItalic.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-Italic.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-Italic.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-LightItalic.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-Medium.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-MediumItalic.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-Regular.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-SemiBold.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-SemiBoldItalic.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-Thin.ttf",
		":/Resources/Fonts/FiraSansCondensed/FiraSansCondensed-ThinItalic.ttf"
	};
}

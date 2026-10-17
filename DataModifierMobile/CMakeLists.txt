cmake_minimum_required(VERSION 3.16)

## ----------------------------------------
## Global variables

set(A_NAME DataModifierMobile)
set(A_NAME_TARGET target_${A_NAME})
set(A_NAME_APPLICATION ${A_NAME})
set(A_PREFIX A_${A_NAME_TARGET})
set(${A_PREFIX}_DIR_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(${A_PREFIX}_VERSION 1.0.7)
set(${A_PREFIX}_VERSION_SHORT 1.0)
set(${A_PREFIX}_VERSION_CODE 10)

set(${A_PREFIX}_SOURCES_GLOBAL_CONFIG_HEADER ${${A_PREFIX}_DIR_ROOT}/dmmobile_conf.h)
write_file(${${A_PREFIX}_SOURCES_GLOBAL_CONFIG_HEADER}
	"#ifndef MAIN_CONF_H\n"
	"#define MAIN_CONF_H\n"
	"#define _DM_VERSION_FULL \"${${A_PREFIX}_VERSION}\"\n"
	"#define _DM_VERSION_SHORT \"${${A_PREFIX}_VERSION_SHORT}\"\n"
	"#define _DM_VERSION_CODE \"${${A_PREFIX}_VERSION_CODE}\"\n"
	"#endif\n"
)

set(${A_PREFIX}_BUILD_TYPE ${CMAKE_BUILD_TYPE})
if(NOT ${A_PREFIX}_BUILD_TYPE STREQUAL "")
	message(STATUS "Defined build type: " ${${A_PREFIX}_BUILD_TYPE})
else()
	set(${A_PREFIX}_BUILD_TYPE "Debug")
	message(STATUS "Can't define build type from config. Using default 'Debug' value")
endif()


## ----------------------------------------
## Global configuration

set(${A_PREFIX}_GLOBAL_CONF "${${A_PREFIX}_DIR_ROOT}/../Global.conf.cmake")
if(EXISTS ${${A_PREFIX}_GLOBAL_CONF})
	include(${${A_PREFIX}_GLOBAL_CONF})
	message(STATUS "Added global configuration file: " ${${A_PREFIX}_GLOBAL_CONF})
else()
	message(FATAL_ERROR "No global configuration file: " ${${A_PREFIX}_GLOBAL_CONF})
endif()


## ----------------------------------------
## Project settings

project(${A_NAME_TARGET} VERSION ${${A_PREFIX}_VERSION} LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)


## ----------------------------------------
## Project variables

set(${A_PREFIX}_DIR_PLATFORMS ${${A_PREFIX}_DIR_ROOT}/Platforms)

set(${A_PREFIX}_SOURCES)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE)
set(${A_PREFIX}_SOURCES_HEADERS)
set(${A_PREFIX}_SOURCES_CPP)
set(${A_PREFIX}_SOURCES_QML)

set(${A_PREFIX}_PROPERTIES)

set(${A_PREFIX}_INCLUDE_DIR_PUBLIC)
set(${A_PREFIX}_INCLUDE_DIR_PRIVATE)


## ----------------------------------------
## Project sources

set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	dmmobile_pch.h
)

set(${A_PREFIX}_SOURCES_HEADERS
	${${A_PREFIX}_SOURCES_HEADERS}
	Backend/dmbackend.h
	Backend/dmbackendconfig.h
	Config/dmconfig.h
	Config/dmconfigglobal.h
	Logger/dmloggeragentdefault.h
	Settings/dmsettingsdriver.h
)

set(${A_PREFIX}_SOURCES_CPP
	${${A_PREFIX}_SOURCES_CPP}
	dmmobile.cpp
	Backend/dmbackend.cpp
	Config/dmconfig.cpp
	Logger/dmloggeragentdefault.cpp
	Settings/dmsettingsdriver.cpp
)

set(${A_PREFIX}_SOURCES
	${${A_PREFIX}_SOURCES_GLOBAL_CONFIG_HEADER}
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${${A_PREFIX}_SOURCES_HEADERS}
	${${A_PREFIX}_SOURCES_CPP}
)

set(${A_PREFIX}_INCLUDE_DIR_PUBLIC
	${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
	${${A_PREFIX}_DIR_ROOT}
	${${A_PREFIX}_DIR_ROOT}/Backend
	${${A_PREFIX}_DIR_ROOT}/Config
	${${A_PREFIX}_DIR_ROOT}/Logger
)

if(APPLE)

	enable_language(OBJC OBJCXX Swift)

	set(${A_PREFIX}_PROPERTIES
		${${A_PREFIX}_PROPERTIES}
		MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
		MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
		MACOSX_BUNDLE TRUE
	)

endif()

if(IOS)

	enable_language(OBJC OBJCXX Swift)

	set(${A_PREFIX}_IOS_BUNDLE_ID ${A_GLOBAL_IOS_BUNDLE_ID_DEBUG})
	set(${A_PREFIX}_IOS_BUNDLE_NAME "Modifier.Debug")
	if(NOT ${A_PREFIX}_BUILD_TYPE STREQUAL "Debug")
		set(${A_PREFIX}_IOS_BUNDLE_ID ${A_GLOBAL_IOS_BUNDLE_ID_RELEASE})
		set(${A_PREFIX}_IOS_BUNDLE_NAME "Modifier")
	endif()
	message(STATUS "Defined iOS Bundle ID: ${${A_PREFIX}_IOS_BUNDLE_ID}")
	message(STATUS "Defined iOS Bundle Name: ${${A_PREFIX}_IOS_BUNDLE_NAME}")

	set(${A_PREFIX}_IOS_DIR ${${A_PREFIX}_DIR_PLATFORMS}/IOS/${${A_PREFIX}_BUILD_TYPE})
	set(${A_PREFIX}_IOS_DIR_ASSETS ${${A_PREFIX}_IOS_DIR}/Assets.xcassets)

	set(${A_PREFIX}_IOS_INFO_PLIST ${${A_PREFIX}_IOS_DIR}/Info.plist)
	set(${A_PREFIX}_IOS_LAUNCHSCREEN_STORYBOARD ${${A_PREFIX}_IOS_DIR}/LaunchScreen.storyboard)

	set(${A_PREFIX}_SOURCES
		${${A_PREFIX}_SOURCES}
		${${A_PREFIX}_IOS_INFO_PLIST}
		${${A_PREFIX}_IOS_LAUNCHSCREEN_STORYBOARD}
		${${A_PREFIX}_IOS_DIR_ASSETS}
	)

	set_source_files_properties("${${A_PREFIX}_IOS_DIR_ASSETS}"
		PROPERTIES
			MACOSX_PACKAGE_LOCATION "Resources"
	)

	set(${A_PREFIX}_PROPERTIES
		${${A_PREFIX}_PROPERTIES}
		VERSION "${${A_PREFIX}_VERSION}"
		SOVERSION "${${A_PREFIX}_VERSION_SHORT}"
		MACOSX_BUNDLE TRUE
		MACOSX_BUNDLE_GUI_IDENTIFIER ${${A_PREFIX}_IOS_BUNDLE_ID}
		MACOSX_BUNDLE_BUNDLE_NAME ${${A_PREFIX}_IOS_BUNDLE_NAME}
		MACOSX_BUNDLE_INFO_PLIST ${${A_PREFIX}_IOS_INFO_PLIST}
		MACOSX_BUNDLE_SHORT_VERSION_STRING "${${A_PREFIX}_VERSION}"
		MACOSX_BUNDLE_BUNDLE_VERSION "${${A_PREFIX}_VERSION}"
		XCODE_ATTRIBUTE_CURRENT_PROJECT_VERSION "${${A_PREFIX}_VERSION}"
		XCODE_ATTRIBUTE_MARKETING_VERSION "${${A_PREFIX}_VERSION_SHORT}"
		XCODE_ATTRIBUTE_GENERATE_INFOPLIST_FILE YES
		XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_APPICON_NAME AppIcon
		QT_IOS_LAUNCH_SCREEN ${${A_PREFIX}_IOS_LAUNCHSCREEN_STORYBOARD}
	)

		# XCODE_ATTRIBUTE_DEBUG_INFORMATION_FORMAT "dwarf-with-dsym"
		# XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS "YES"
		# XCODE_ATTRIBUTE_DEPLOYMENT_POSTPROCESSING "YES"
		# XCODE_ATTRIBUTE_DWARF_DSYM_FILE_SHOULD_ACCOMPANY_PRODUCT "YES"
		# XCODE_ATTRIBUTE_SKIP_INSTALL "NO"
		# XCODE_ATTRIBUTE_INSTALL_PATH "/Applications"

endif()

if(ANDROID)

	set(QT_FORCE_CMP0156_TO_VALUE NEW)

	set(${A_PREFIX}_ANDROID_DIR ${${A_PREFIX}_DIR_PLATFORMS}/Android/${${A_PREFIX}_BUILD_TYPE})
	set(${A_PREFIX}_ANDROID_PACKAGE_NAME ${A_GLOBAL_ANDROID_PACKAGE_NAME_DEBUG})

	if(NOT ${A_PREFIX}_BUILD_TYPE STREQUAL "Debug")
		set(QT_ANDROID_ABIS "arm64-v8a;armeabi-v7a" CACHE STRING "Target Android ABIs" FORCE)
		set(${A_PREFIX}_ANDROID_PACKAGE_NAME ${A_GLOBAL_ANDROID_PACKAGE_NAME_RELEASE})
	endif()
	message(STATUS "Defined Android package name: ${${A_PREFIX}_ANDROID_PACKAGE_NAME}")

	if(${ANDROID_ABI} STREQUAL "x86_64")
		message(STATUS "Android Build for x86_64")
	elseif(${ANDROID_ABI} STREQUAL "x86")
		message(STATUS "Android Build for x86")
	elseif(${ANDROID_ABI} STREQUAL "armeabi-v7a")
		message(STATUS "Android Build for armeabi-v7a")
	elseif(${ANDROID_ABI} STREQUAL "arm64-v8a")
		message(STATUS "Android Build for arm64-v8a")
	else()
		message(FATAL_ERROR "Android undefined build")
	endif()

	set(${A_PREFIX}_PROPERTIES
		${${A_PREFIX}_PROPERTIES}
		QT_ANDROID_PACKAGE_NAME "${${A_PREFIX}_ANDROID_PACKAGE_NAME}"
		QT_ANDROID_VERSION_CODE ${${A_PREFIX}_VERSION_CODE}
		QT_ANDROID_VERSION_NAME "${${A_PREFIX}_VERSION}"
		QT_ANDROID_PACKAGE_SOURCE_DIR ${${A_PREFIX}_ANDROID_DIR}
		QT_ANDROID_MIN_SDK_VERSION "30"
		QT_ANDROID_API_VERSION "37"
		QT_ANDROID_TARGET_SDK_VERSION "37"
	)

	set(${A_PREFIX}_SOURCES
		${${A_PREFIX}_SOURCES}
		${${A_PREFIX}_ANDROID_DIR}/AndroidManifest.xml
		${${A_PREFIX}_ANDROID_DIR}/build.gradle
		${${A_PREFIX}_ANDROID_DIR}/res/values/libs.xml
		${${A_PREFIX}_ANDROID_DIR}/res/values/styles.xml
		${${A_PREFIX}_ANDROID_DIR}/res/xml/qtprovider_paths.xml
	)

endif()


## ----------------------------------------
## Qt Application settings

find_package(Qt6 REQUIRED COMPONENTS Quick Svg QuickControls2 LinguistTools)

qt_standard_project_setup(REQUIRES 6.8)

set(QT_I18N_TRANSLATED_LANGUAGES en es pt ru fr)

qt_add_executable(${A_NAME_APPLICATION}	${${A_PREFIX}_SOURCES})

qt_add_translations(${A_NAME_APPLICATION}
	RESOURCE_PREFIX "/Translations"
	TS_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Translations"
	TS_FILE_BASE "DataModifier"
	LRELEASE_OPTIONS "-idbased"
)

qt_add_qml_module(${A_NAME_APPLICATION}
	URI UI${A_NAME_APPLICATION}
	VERSION 1.0
	QML_FILES
		UI/AUIPrimitives/Button/AButton.qml
		UI/AUIPrimitives/Button/AAreaCircleButton.qml
		UI/AUIPrimitives/Button/AAreaButton.qml
		UI/AUIPrimitives/Window/AWindowMobileSafeArea.qml
		UI/AUIPrimitives/Geometry/ACircle.qml
		UI/AUIPrimitives/Text/Input/ATextInputMobileWrapped.qml
		UI/AUIPrimitives/Text/Input/ATextInputMobilePasswordWrapped.qml
		UI/AUIPrimitives/Text/Flickable/ATextFlickable.qml
		UI/AUIPrimitives/Text/Flickable/ATextEditMobileFlickable.qml
		UI/AUIPrimitives/Screen/AScreen.qml
		UI/AUIPrimitives/Sign/ASignActionRandomColors.qml
		UI/AUIPrimitives/VectorImage/AVectorImage.qml
		UI/DMUIComponents/Button/DMButton.qml
		UI/DMUIComponents/Button/DMAreaButton.qml
		UI/DMUIComponents/Button/DMCircleCryptoButton.qml
		UI/DMUIComponents/Button/DMButtonPasswordMenu.qml
		UI/DMUIComponents/Button/DMButtonTextMenu.qml
		UI/DMUIComponents/Controls/DMRadioButton.qml
		UI/DMUIComponents/Text/DMText.qml
		UI/DMUIComponents/Text/DMTextRegular.qml
		UI/DMUIComponents/Text/DMTextHeader.qml
		UI/DMUIComponents/Text/DMTextEdit.qml
		UI/DMUIComponents/Text/DMTextInputPassword.qml
		UI/DMUIComponents/Window/DMWindowMobile.qml
		UI/DMUIComponents/Separator/DMSeparatorVerticalWhite.qml
		UI/DMUIComponents/Sign/DMSignLineLeft.qml
		UI/DMUIComponents/Sign/DMSignLineRight.qml
		UI/DMUIComponents/Sign/DMSignAction.qml
		UI/DMUIComponents/MainMenu/DMMenuSwitch.qml
		UI/DMUIComponents/MainMenu/DMMenuButton.qml
		UI/DMUIComponents/MainMenu/DMMenuButtonQuit.qml
		UI/DMUIComponents/MainMenu/DMMenuLanguage.qml
		UI/DMUIComponents/MainMenu/DMMenuEncryption.qml
		UI/DMUIComponents/MainMenu/DMMenuUISchema.qml
		UI/DMUIComponents/MainMenu/DMMenuAbout.qml
		UI/DMUIComponents/Screen/DMScreen.qml
		UI/DMUI/Button/Screen/AllInOne/DMButtonDecrypt_all_in_one.qml
		UI/DMUI/Button/Screen/AllInOne/DMButtonEncrypt_all_in_one.qml
		UI/DMUI/Button/Screen/AllInOne/DMButtonMainMenu_all_in_one.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonEncrypt_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonDecrypt_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonEncryptedCopy_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonDecryptedCopy_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonPasteDecrypted_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonPasteAndDecrypt_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonMainMenu_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonText_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonTextDecrypted_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonTextEncrypted_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonBlockDecrypted_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonBlockEncrypted_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonPasteDecrypted_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonEncryptAndCopy_splitted.qml
		UI/DMUI/Button/Screen/Splitted/DMButtonPasteEncrypted_splitted.qml
		UI/DMUI/Button/DMButtonAuxiliary.qml
		UI/DMUI/Button/MenuPassword/DMButtonPasswordBarMenu.qml
		UI/DMUI/Button/MenuPassword/DMButtonPasswordVisible.qml
		UI/DMUI/MainWindow/DMMainWindow.qml
		UI/DMUI/Screen/DMScreenMain.qml
		UI/DMUI/Screen/DMScreenMainAllInOne.qml
		UI/DMUI/Screen/DMScreenMainSplited.qml
		UI/DMUI/Screen/DMScreenMenu.qml
		UI/DMUI/Screen/DMScreenTest.qml
		UI/DMUI/Content/DMContent.qml
		UI/DMUI/Components/DMFooter.qml
		UI/DMUI/Components/DMActions.qml
		UI/DMUI/Components/DMFooterInputPassword.qml
		UI/DMUI/Bar/Text/DMBarText_all_in_one.qml
		UI/DMUI/Bar/Text/DMBarTextDecrypted_splitted.qml
		UI/DMUI/Bar/Text/DMBarTextEncrypted_splitted.qml
		UI/DMUI/Bar/Text/DMBarTextMenu_splitted.qml
		UI/DMUI/Bar/Text/DMBarTextSelectedSign_splitted.qml
		UI/DMUI/Bar/DMBarActionButtons.qml
		UI/DMUI/Bar/DMBarMainMenu.qml
		UI/DMUI/Bar/DMBarPassword.qml
		UI/DMUI/Bar/DMBarPasswordMenu.qml
		UI/DMUI/MainMenu/DMMainMenu.qml
)


## ----------------------------------------
## Application properties

list(LENGTH ${A_PREFIX}_PROPERTIES ${A_PREFIX}_PROPERTIES_LENGTH)
if(NOT ${A_PREFIX}_PROPERTIES_LENGTH EQUAL 0)
	set_target_properties(${A_NAME_APPLICATION} PROPERTIES ${${A_PREFIX}_PROPERTIES})
endif()


## ----------------------------------------
## Include directories settings

target_include_directories(${A_NAME_APPLICATION}
	PUBLIC ${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
	PRIVATE ${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
)


## ----------------------------------------
## Libraries settings

target_link_libraries(${A_NAME_APPLICATION}
	PUBLIC
		Qt6::Quick
		Qt6::QuickControls2
		Qt6::Svg
		AUniversal
		ATemplates
		AApplication
		ASettings
		APrivacy
		ALogger
		ADevice
		AUIHandler
		AClipboard
		AQML
		AQMLplugin
		DMResources
		DMCore
)


## ----------------------------------------
## Precompiled headers settings

if(
	NOT ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE} EQUAL "" OR
	NOT ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC} EQUAL ""
)
    if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_OPTION_USING_PCH)
        message(STATUS "Using PCH for ${A_NAME_APPLICATION}")
        target_precompile_headers(${A_NAME_APPLICATION}
			PRIVATE ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
			PUBLIC ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
        )
        set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
    else()
        message(STATUS "No PCH for ${A_NAME_APPLICATION}")
    endif()
endif()

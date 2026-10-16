cmake_minimum_required(VERSION 3.16)


## ----------------------------------------
## Global settings

set(A_NAME_TARGET DMResources)
set(A_PREFIX A_${A_NAME_TARGET})


## ----------------------------------------
## Project settings

project(${A_NAME_TARGET} LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)


## ----------------------------------------
## Library variables

set(${A_PREFIX}_DIR_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

set(${A_PREFIX}_SOURCES)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE)
set(${A_PREFIX}_SOURCES_HEADERS)
set(${A_PREFIX}_SOURCES_CPP)
set(${A_PREFIX}_SOURCES_RESOURCES)

set(${A_PREFIX}_INCLUDE_DIR_PUBLIC)
set(${A_PREFIX}_INCLUDE_DIR_PRIVATE)


## ----------------------------------------
## Library sources

set(${A_PREFIX}_SOURCES_RESOURCES_FONTS
	Fonts/FiraSansCondensed/FiraSansCondensed-Black.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-BlackItalic.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-Bold.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-BoldItalic.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-ExtraBold.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-ExtraBoldItalic.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-ExtraLight.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-ExtraLightItalic.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-Italic.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-Light.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-LightItalic.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-Medium.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-MediumItalic.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-Regular.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-SemiBold.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-SemiBoldItalic.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-Thin.ttf
	Fonts/FiraSansCondensed/FiraSansCondensed-ThinItalic.ttf
)

set(${A_PREFIX}_SOURCES_RESOURCES_IMAGES
	Images/Button/MainMenu/DM_ButtonMainMenuQuit_active.svg
	Images/Button/MainMenu/DM_ButtonMainMenuQuit_hover.svg
	Images/Button/MainMenu/DM_ButtonMainMenuSign.svg
	Images/Button/MainMenu/DM_ButtonMainMenuSign_Encrypt.svg
	Images/Button/MainMenu/DM_ButtonMainMenuSign_Decrypt.svg
	Images/Button/Modifier/DM_ButtonDecrypt.svg
	Images/Button/Modifier/DM_ButtonPasteAndDecrypt.svg
	Images/Button/Modifier/DM_ButtonEncrypt.svg
	Images/Button/Modifier/DM_ButtonEncryptAndCopy.svg
	Images/Button/Modifier/DM_ButtonHoverBig.svg
	Images/Button/Modifier/DM_ButtonHoverSmall.svg
	Images/Button/Modifier/DM_ButtonCopy.svg
	Images/Button/Modifier/DM_ButtonPaste.svg
	Images/Button/Password/DM_ButtonPasswordSign.svg
	Images/Button/Password/DM_ButtonPasswordSign_hover.svg
	Images/Button/Password/DM_ButtonPasswordSignAccept.svg
	Images/Button/Password/DM_ButtonPasswordSignVisibleActive.svg
	Images/Button/Password/DM_ButtonPasswordSignVisibleHover.svg
	Images/Button/Password/DM_ButtonPasswordSignHiddenActive.svg
	Images/Button/Password/DM_ButtonPasswordSignHiddenHover.svg
	Images/Button/Password/DM_ButtonPasswordSignLeft.svg
	Images/Button/Password/DM_ButtonPasswordSignRight.svg
	Images/Button/Password/DM_ButtonPasswordCopyFromClipboard.svg
	Images/Button/Password/DM_ButtonPasswordCopyToClipboard.svg
	Images/Button/Password/DM_ButtonPasswordDelete.svg
	Images/Button/Password/DM_ButtonPasswordHover.svg
	Images/Button/Decrypted/DM_ButtonAcceptDecrypted_active.svg
	Images/Button/Decrypted/DM_ButtonCancelDecrypted_active.svg
	Images/Button/Decrypted/DM_ButtonDecrypted_hover.svg
	Images/Button/Cancel/DM_ButtonCancelEncrypted_active.svg
	Images/Button/Cancel/DM_ButtonCancelEncrypted_hover.svg
	Images/Button/Cancel/DM_ButtonCancelMainMenu_active.svg
	Images/Button/Cancel/DM_ButtonCancelMainMenu_hover.svg
	Images/Button/TextEdit/DM_ButtonTextEditMenuSign.svg
	Images/Button/TextEdit/DM_ButtonTextEditCopy.svg
	Images/Button/TextEdit/DM_ButtonTextEditDelete.svg
	Images/Button/TextEdit/DM_ButtonTextEditOk.svg
	Images/Button/TextEdit/DM_ButtonTextEditPaste.svg
	Images/Button/TextEdit/DM_ButtonTextEditWrite.svg
	Images/Button/TextEdit/DM_ButtonTextEditMenuSign_purple.svg
	Images/Button/TextEdit/DM_ButtonTextEditCopy_purple.svg
	Images/Button/TextEdit/DM_ButtonTextEditDelete_purple.svg
	Images/Button/TextEdit/DM_ButtonTextEditOk_purple.svg
	Images/Button/TextEdit/DM_ButtonTextEditPaste_purple.svg
	Images/Button/TextEdit/DM_ButtonTextEditWrite_purple.svg
	Images/Button/TextEdit/DM_ButtonTextEditCopy_blue.svg
	Images/Button/TextEdit/DM_ButtonTextEditPaste_blue.svg
	Images/Button/TextEdit/DM_ButtonTextEditDelete_blue.svg
	Images/Button/TextEdit/DM_ButtonTextEditMenuSign_blue.svg
	Images/Elements/DM_SignFooterPassword_active.svg
	Images/Elements/DM_SignFooterPassword_hover.svg
	Images/Elements/DM_SignPasswordMenu.svg
	Images/Elements/DM_SignTextSelectedLeft.svg
	Images/Elements/DM_SignTextSelectedRight.svg
	Images/Separator/DM_SeparatorVerticalWhite.svg
	Images/Logo/DM_LogoMainMenu.svg
	Images/Logo/DM_LogoButtonMainMenu_active.svg
	Images/Logo/DM_LogoButtonMainMenu_hover.svg
	Images/Backgrounds/DM_BackgroundTextEncrypted.png
	Images/Backgrounds/DM_BackgroundTextDecrypted_hover.png
	Images/Backgrounds/DM_BackgroundTextDecrypted_active.png
)

set(${A_PREFIX}_SOURCES_RESOURCES
	${${A_PREFIX}_SOURCES_RESOURCES}
	${${A_PREFIX}_SOURCES_RESOURCES_FONTS}
	${${A_PREFIX}_SOURCES_RESOURCES_IMAGES}
)

set(${A_PREFIX}_SOURCES
	${${A_PREFIX}_SOURCES}
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${${A_PREFIX}_SOURCES_HEADERS}
	${${A_PREFIX}_SOURCES_CPP}
)

set(${A_PREFIX}_INCLUDE_DIR_PUBLIC
	${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
	${${A_PREFIX}_DIR_ROOT}
)


## ----------------------------------------
## Qt settings

find_package(Qt6 REQUIRED COMPONENTS Core Qml)

qt_standard_project_setup(REQUIRES 6.8)
qt_add_library(${A_NAME_TARGET} STATIC ${${A_PREFIX}_SOURCES})
qt_add_resources(${A_NAME_TARGET} "DMResources"
	PREFIX "Resources"
	FILES ${${A_PREFIX}_SOURCES_RESOURCES}
)

target_link_libraries(${A_NAME_TARGET}
	PRIVATE
		Qt6::Core
		Qt6::Qml
)

target_compile_definitions(${A_NAME_TARGET}
	PRIVATE
		DMRESOURCES_LIBRARY
)

target_include_directories(${A_NAME_TARGET}
	PUBLIC ${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
	PRIVATE ${${A_PREFIX}_INCLUDE_DIR_PRIVATE}
)


## ----------------------------------------
## Precompiled headers settings

if(
	NOT ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE} EQUAL "" OR
	NOT ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC} EQUAL ""
)
	if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_OPTION_USING_PCH)
		message(STATUS "Using PCH for ${A_NAME_TARGET}")
		target_precompile_headers(${A_NAME_TARGET}
			PRIVATE ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
			PUBLIC ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
		)
		set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
	else()
		message(STATUS "No PCH for ${A_NAME_TARGET}")
	endif()
endif()

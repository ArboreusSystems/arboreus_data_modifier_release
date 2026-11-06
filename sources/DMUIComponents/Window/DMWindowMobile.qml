// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/01/2026 at 07:23:04
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Window;

// Application includes
import UIDataModifierMobile;
import AEnums;


// Component
AWindowMobileSafeArea {

	id: oRoot;
	pObjectName: "MainWindow";
	pColorBackgroundScreen: AColors.mGetString("Black");
	pColorBackgroundContent: AColors.mTransparent();
	width: ADevice.mType() === AEnumDeviceType.Desktop ? AUIConfig.mDesktopUIWidth() : Screen.width;
	height: ADevice.mType() === AEnumDeviceType.Desktop ? AUIConfig.mDesktopUIHeight() : Screen.height;
}

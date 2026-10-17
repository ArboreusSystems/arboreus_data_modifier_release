// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/06/2026 at 09:51:00
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;

// Application includes
import UIDataModifierMobile;


// Component
ASignActionRandomColors {

	id: oRoot;
	height: 7;
	// width: parent.width;
	// Fix Qt iOS bug with 0 in parent.width
	// Using global window object width
	width: Qt.platform.os === "ios" ? oMainWindow.width : parent.width;
	pElementWidth: 7;

	pColors: [
		"Blue","BlueDark",
		"DeepBlue","DeepBlueDark","DeepBlueLight",
		"Green","GreenDark","GreenLight",
		"Lavanda","LavandaDark",
		"Orange","OrangeDark","OrangeLight",
		"Purple","PurpleDark","PurpleLight",
		"Fuchsia","FuchsiaDark","FuchsiaLight",
		"Red","RedDark","RedLight",
		"RedWine","RedWineDark","RedWineLight",
		"Salad","SaladDark","SaladLight"
	]
}

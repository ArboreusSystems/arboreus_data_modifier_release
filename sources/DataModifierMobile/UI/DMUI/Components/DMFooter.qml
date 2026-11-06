// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/05/2026 at 06:43:31
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;

// Application includes
import UIDataModifierMobile;


// Component
Rectangle {

	id: oRoot;
	width: parent.width;
	height: width / 5.75;
	color: AColors.mGetString("BlueLight");

	DMButtonMenu {

		id: oButtonMenu;
		height: parent.height;
		width: parent.height;
		anchors.right: parent.right;
		anchors.top: parent.top;
	}

	DMFooterInputPassword {

		id: oTextInputPassword;
		height: parent.height * 0.51;
		anchors.left: parent.left;
		anchors.right: oButtonMenu.left;
		anchors.verticalCenter: parent.verticalCenter;
	}
}

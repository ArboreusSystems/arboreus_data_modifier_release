// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/04/2026 at 22:37:53
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;

// Application includes
import UIDataModifierMobile;


// Component
Rectangle {

	required property string pId;

	id: oRoot;
	color: AColor.mTransparent();
	anchors.top: parent.top;

	AAreaCircleButton {

		id: oCircleButton;
		pSize : oRoot.width;
		anchors.top: parent.top;
		anchors.horizontalCenter: parent.horizontalCenter;
	}
}

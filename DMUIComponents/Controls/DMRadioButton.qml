// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/07/2026 at 20:17:15
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes
import UIDataModifierMobile;


// Component
RadioButton {

	id: oRoot;

	indicator: Rectangle {

		implicitWidth: 20;
		implicitHeight: 20;
		x: oRoot.leftPadding;
		y: parent.height / 2 - height / 2;
		color: oRoot.down ? AColors.mGetString("Orange") : AColors.mGetString("GreyDarkest");
		border.color: oRoot.checked ? AColors.mGetString("GreyLight") : AColors.mGetString("GreyDark");
		border.width: 2;

		Rectangle {

			width: 16;
			height: 16;
			x: 2;
			y: 2;
			color: oRoot.down ?  AColors.mGetString("White") : AColors.mGetString("SaladDark");
			visible: oRoot.checked;
		}
	}

	contentItem: Text {

		text: oRoot.text;
		font: oRoot.font;
		color: AColors.mGetString("White");
		verticalAlignment: Text.AlignVCenter;
		leftPadding: oRoot.indicator.width + oRoot.spacing;
	}
}

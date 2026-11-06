// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/06/2026 at 10:47:20
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes
import UIDataModifierMobile;


// Component
Item {

	required property string pID;
	property string pLabel: "Label";
	property string pNotice: "Notice";
	property alias pSwitch: oSwitch;
	property bool pDeclareAction: false;

	id: oRoot;
	height: oLabel.paintedHeight + oNotice.paintedHeight + 5
	width: parent.width;

	DMSignLineLeft {

		id: oSignLineLeft;
		height: AUIConfig.mElementHeight();
		anchors.left: parent.left;
		anchors.top: parent.top;
	}

	DMTextHeader {

		id: oLabel;
		text: oRoot.pLabel;
		color: AColors.mGetString("White");
		anchors.top: parent.top;
		anchors.left: oSignLineLeft.right;
		anchors.leftMargin: oSignLineLeft.height / 2.75;
		anchors.right: oSwitch.left;
		anchors.rightMargin: anchors.leftMargin * 1.1;
	}

	DMText {

		id: oNotice;
		text: oRoot.pNotice;
		color: AColors.mGetString("WhiteDark");
		anchors.top: oLabel.bottom;
		anchors.topMargin: oSignLineLeft.height / 5;
		anchors.left: oSignLineLeft.right;
		anchors.leftMargin: oSignLineLeft.height / 2.75;
		anchors.right: oSwitch.left;
		anchors.rightMargin: anchors.leftMargin * 1.75;
	}

	Switch {

		id: oSwitch;
		implicitWidth: AUIConfig.mElementHeight() * 1.19;
		implicitHeight: AUIConfig.mElementHeight() * 1.19 / 2;
		anchors.verticalCenter: oSignLineLeft.verticalCenter;
		anchors.right: parent.right;
		anchors.rightMargin: oSignLineLeft.width * 1.45;

		indicator: Rectangle {

			id: oIndicatorWrapper;
			implicitWidth: AUIConfig.mElementHeight() * 1.19;
			implicitHeight: AUIConfig.mElementHeight() * 1.19 / 2;
			color: oSwitch.checked ? AColors.mGetString("SaladDark") : AColors.mGetString("GreyDarkest");
			border.color: oSwitch.checked ? AColors.mGetString("GreyLight") : AColors.mGetString("GreyDark");
			border.width: 2;

			Rectangle {

				id: oIndicator;
				x: oSwitch.checked ? parent.width - width : 0;
				width: oIndicatorWrapper.height;
				height: oIndicatorWrapper.height;
				color: oSwitch.down ? AColors.mGetString("Orange") : AColors.mGetString("White");
			}
		}

		Component.onCompleted: {

			oSwitch.checked = ASettings.mGetValue(oRoot.pID);
		}

		onClicked: {

			ASettings.mSetValue(oRoot.pID,checked);
			console.debug("Set '" + oRoot.pID + "': " + checked);
			if (typeof oRoot.mSetOnSwitch === 'function') oRoot.mSetOnSwitch(checked);
			if (oRoot.pDeclareAction) AApplication.mDeclareAction([oRoot.pID,"onClicked",0]);
		}
	}
}

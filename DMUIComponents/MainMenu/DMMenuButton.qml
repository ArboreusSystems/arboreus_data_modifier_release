// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/07/2026 at 09:43:15
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
	property alias pButton: oButton;
	property alias pImage: oImage;
	property string pImageActive: "";
	property string pImageHover: "";
	property bool pDeclareAction: false;

	id: oRoot;
	height: oLabel.paintedHeight + oNotice.paintedHeight + 5
	width: parent.width;
	state: "Active";

	states: [

		State {

			name: "Active";

			PropertyChanges {

				target: oImage;
				source: oRoot.pImageActive;
			}
		},

		State {

			name: "Hover";

			PropertyChanges {

				target: oImage;
				source: oRoot.pImageHover;
			}
		}
	]

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
		anchors.right: oButtonWrapper.left;
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
		anchors.right: oButtonWrapper.left;
		anchors.rightMargin: anchors.leftMargin * 1.75;
	}

	Item {

		id: oButtonWrapper;
		height: oSignLineLeft.height;
		width: oSignLineLeft.height;
		anchors.verticalCenter: oSignLineLeft.verticalCenter;
		anchors.right: parent.right;
		anchors.rightMargin: oSignLineLeft.width * 1.45;

		DMAreaButton {

			id: oButton;
			pID: oRoot.pID;
			anchors.fill: parent;

			pMouseArea.onPressed: {

				oRoot.state = "Active";
			}

			pMouseArea.onReleased: {

				oRoot.state = "Hover";
			}
		}

		Image {

			id: oImage;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.horizontalCenter: parent.horizontalCenter;
			fillMode: Image.PreserveAspectFit;
			visible: false;
		}
	}
}


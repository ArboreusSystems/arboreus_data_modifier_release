// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/07/2026 at 20:23:43
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

	required property string pSourceActive;
	required property string pSourceHover;

	property alias pID: oButton.pID;
	property alias pMouseArea: oButton.pMouseArea;

	id: oRoot;
	height: oButton.height * 1.39;
	state: "Active";

	states: [

		State {

			name: "Active";

			PropertyChanges {

				target: oIcon;
				source: oRoot.pSourceActive;
			}

			PropertyChanges {

				target: oButton;
				color: AColors.mTransparent();
			}
		},

		State {

			name: "Hover";

			PropertyChanges {

				target: oIcon;
				source: oRoot.pSourceHover;
			}

			PropertyChanges {

				target: oButton;
				color: AColors.mGetString("Salad");
			}
		}
	]

	Image {

		id: oSign;
		height: oRoot.height * 0.29;
		source: "qrc:/Resources/Images/Elements/DM_SignPasswordMenu.svg";
		fillMode: Image.PreserveAspectFit;
		anchors.bottom: parent.bottom;
		anchors.horizontalCenter: parent.horizontalCenter;
	}

	DMAreaButton {

		id: oButton;
		width: parent.width;
		height: parent.width;
		anchors.top: parent.top;
		anchors.horizontalCenter: parent.horizontalCenter;
		border.color: AColors.mGetString("White");
		border.width: 2;

		pMouseArea.onPressed: {

			oRoot.state = "Hover";
		}

		pMouseArea.onReleased: {

			oRoot.state = "Active";
		}

		Image {

			id: oIcon;
			width: parent.width * 0.67;
			height: parent.height * 0.67;
			fillMode: Image.PreserveAspectFit;
			source: oRoot.pSourceActive;
			anchors.horizontalCenter: oButton.horizontalCenter;
			anchors.verticalCenter: oButton.verticalCenter;
		}
	}
}

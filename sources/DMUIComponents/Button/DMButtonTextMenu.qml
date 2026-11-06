// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/08/2026 at 09:31:14
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

	required property string pImageSourceActive;
	required property string pImageSourceHover;
	property alias pMouseArea: oButton.pMouseArea;
	property alias pID: oButton.pID;
	property string pType: "Universal";

	id: oRoot;
	height: oColumn.implicitHeight;
	width: oButton.width;
	state: "Active";

	states: [

		State {

			name: "Active";

			PropertyChanges {

				target: oButton;
				color: AColors.mGetString("WhiteLight");
				border.color: {

					if (oRoot.pType === "Universal") {
						AColors.mGetString("GreyDarkest");
					} else if (oRoot.pType === "Decrypted") {
						AColors.mGetString("Purple");
					} else if (oRoot.pType === "Encrypted") {
						AColors.mGetString("Blue");
					}
				}
			}

			PropertyChanges {

				target: oButtonImage;
				source: oRoot.pImageSourceActive;
			}
		},

		State {

			name: "Hover";

			PropertyChanges {

				target: oButtonImage;
				source: oRoot.pImageSourceHover;
			}

			PropertyChanges {

				target: oButton;
				color: AColors.mGetString("Salad");
				border.color: AColors.mGetString("Salad");
			}
		}
	]

	Column {

		id: oColumn;
		bottomPadding: 3;
		anchors.horizontalCenter: parent.horizontalCenter;

		DMAreaButton {

			id: oButton;
			width: 30;
			height: 30;
			border.width: 2;
			anchors.horizontalCenter: parent.horizontalCenter;

			pMouseArea.onPressed: {

				oRoot.state = "Hover";
			}

			pMouseArea.onReleased: {

				oRoot.state = "Active";
			}

			Image {

				id: oButtonImage;
				width: parent.width * 0.69;
				height: parent.height * 0.69;
				fillMode: Image.PreserveAspectFit;
				anchors.verticalCenter: parent.verticalCenter;
				anchors.horizontalCenter: parent.horizontalCenter;
			}
		}

		Item {

			id: oSign;
			height: 15;
			width: 20;
			anchors.horizontalCenter: parent.horizontalCenter;
			clip: true;

			Image {

				id: oSignImage;
				width: parent.width;
				height: width * 1.31;
				fillMode: Image.PreserveAspectFit;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.bottom: parent.bottom;

				source: {

					if (oRoot.pType === "Universal") {
						return "qrc:/Resources/Images/Button/TextEdit/DM_ButtonTextEditMenuSign.svg";
					} else if (oRoot.pType === "Decrypted") {
						return "qrc:/Resources/Images/Button/TextEdit/DM_ButtonTextEditMenuSign_purple.svg";
					} else if (oRoot.pType === "Encrypted") {
						return "qrc:/Resources/Images/Button/TextEdit/DM_ButtonTextEditMenuSign_blue.svg";
					}
				}
			}
		}
	}
}

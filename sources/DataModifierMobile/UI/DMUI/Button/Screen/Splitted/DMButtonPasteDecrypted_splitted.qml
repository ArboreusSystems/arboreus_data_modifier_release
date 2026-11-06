// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/08/2026 at 21:14:10
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;

// Application includes
import UIDataModifierMobile;


// Component
Item {

	id: oRoot;
	height: oColumn.implicitHeight;
	state: "Active";

	states: [

		State {

			name: "Hover";

			PropertyChanges {

				target: oButton;
				color: AColors.mGetString("Salad");
			}

			PropertyChanges {

				target: oImageButtonPaste;
				source: "qrc:/Resources/Images/Button/Modifier/DM_ButtonHoverSmall.svg";
			}
		},

		State {

			name: "Active";

			PropertyChanges {

				target: oButton;
				color: AColors.mGetString("Purple");
			}

			PropertyChanges {

				target: oImageButtonPaste;
				source: "qrc:/Resources/Images/Button/Modifier/DM_ButtonPaste.svg";
			}
		}
	]

	Column {

		id: oColumn;
		width: parent.width;
		anchors.horizontalCenter: parent.horizontalCenter;

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
				source: "qrc:/Resources/Images/Button/MainMenu/DM_ButtonMainMenuSign_Decrypt.svg";
				fillMode: Image.PreserveAspectFit;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.bottom: parent.bottom;
			}
		}

		Item {

			width: parent.width;
			height: 3;
			anchors.horizontalCenter: parent.horizontalCenter;
		}

		DMAreaButton {

			id: oButton;
			pID: "oButtonPasteDecrypted";
			width: parent.width;
			height: oButton.width;
			radius: width * 0.5;
			color: AColors.mGetString("Purple");

			pMouseArea.onPressed: {

				oRoot.state = "Hover";
			}

			pMouseArea.onReleased: {

				oRoot.state = "Active";
			}

			Image {

				id: oImageButtonPaste;
				width: parent.width * 0.70;
				height: parent.height * 0.70;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.verticalCenter: parent.verticalCenter;
			}
		}
	}
}

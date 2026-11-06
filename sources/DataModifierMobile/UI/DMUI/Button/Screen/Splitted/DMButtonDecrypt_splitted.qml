// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/06/2026 at 19:49:22
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;

// Application includes
import UIDataModifierMobile;


// Component
Item {

	property alias pMouseArea: oButton.pMouseArea;

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

				target: oLabel;
				color: AColors.mGetString("Salad");
			}

			PropertyChanges {

				target: oImageButtonDecrypt;
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

				target: oLabel;
				color: AColors.mGetString("Purple");
			}

			PropertyChanges {

				target: oImageButtonDecrypt;
				source: "qrc:/Resources/Images/Button/Modifier/DM_ButtonDecrypt.svg";
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
			pID: "oButtonDecrypt";
			width: parent.width;
			height: oButton.width;
			radius: oButton.width * 0.5;
			color: AColors.mGetString("Purple");

			pMouseArea.onPressed: {

				oRoot.state = "Hover";
			}

			pMouseArea.onReleased: {

				oRoot.state = "Active";
			}

			Image {

				id: oImageButtonDecrypt;
				width: parent.width * 0.70;
				height: parent.height * 0.70;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.verticalCenter: parent.verticalCenter;
			}
		}

		Item {

			width: parent.width;
			height: 3;
			anchors.horizontalCenter: parent.horizontalCenter;
		}

		DMText {

			id: oLabel;
			text: "DECRYPT";
			width: parent.width * 1.4;
			font.pixelSize: 11;
			font.bold: true;
			horizontalAlignment: Text.AlignHCenter;
			verticalAlignment: Text.AlignVCenter;
			anchors.horizontalCenter: parent.horizontalCenter;
		}
	}
}
// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/08/2026 at 21:57:32
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick

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

				target: oImageButtonEncryptAndCopy;
				source: "qrc:/Resources/Images/Button/Modifier/DM_ButtonHoverBig.svg";
			}
		},

		State {

			name: "Active";

			PropertyChanges {

				target: oButton;
				color: AColors.mGetString("Blue");
			}

			PropertyChanges {

				target: oLabel;
				color: AColors.mGetString("Blue");
			}

			PropertyChanges {

				target: oImageButtonEncryptAndCopy;
				source: "qrc:/Resources/Images/Button/Modifier/DM_ButtonEncryptAndCopy.svg";
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
				source: "qrc:/Resources/Images/Button/MainMenu/DM_ButtonMainMenuSign_Encrypt.svg";
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
			pID: "ButtonEncryptAndCopy";
			width: parent.width;
			height: oButton.width * 0.52;
			color: AColors.mGetString("Blue");

			pMouseArea.onPressed: {

				oRoot.state = "Hover";
			}

			pMouseArea.onReleased: {

				oRoot.state = "Active";
			}

			Image {

				id: oImageButtonEncryptAndCopy;
				width: parent.width * 0.70;
				height: parent.height * 0.70;
				fillMode: Image.PreserveAspectFit;
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
			text: "ENCRYPT & COPY"
			width: parent.width * 1.4;
			font.pixelSize: 11;
			font.bold: true;
			horizontalAlignment: Text.AlignHCenter;
			verticalAlignment: Text.AlignVCenter;
			anchors.horizontalCenter: parent.horizontalCenter;
		}
	}
}

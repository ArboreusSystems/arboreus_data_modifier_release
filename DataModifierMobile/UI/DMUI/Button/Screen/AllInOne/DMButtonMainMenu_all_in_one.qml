// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/06/2026 at 12:47:35
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;

// Application includes
import UIDataModifierMobile;


// Component
Item {

	property alias pMouseArea: oButtonMainMenu.pMouseArea;
	property alias pID: oButtonMainMenu.pID;
	property int pTopBarHeight: 20;
	property int pTopBarLineHeight: 2;

	id: oRoot;
	height: oColumn.implicitHeight;
	state: "Active";

	states: [

		State {

			name: "Active";

			PropertyChanges {

				target: oImageMainMenu;
				source: "qrc:/Resources/Images/Logo/DM_LogoButtonMainMenu_active.svg";
			}
		},

		State {

			name: "Hover";

			PropertyChanges {

				target: oImageMainMenu;
				source: "qrc:/Resources/Images/Logo/DM_LogoButtonMainMenu_hover.svg";
			}
		}
	]

	Column {

		id: oColumn;
		anchors.horizontalCenter: parent.horizontalCenter;

		Rectangle {

			id: oTopBar;
			width: oRoot.pTopBarHeight * 2.34;
			height: oRoot.pTopBarHeight;
			anchors.horizontalCenter: parent.horizontalCenter;
			color: AColors.mGetString("DeepBlue");
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
				source: "qrc:/Resources/Images/Button/MainMenu/DM_ButtonMainMenuSign.svg";
				fillMode: Image.PreserveAspectFit;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.bottom: parent.bottom;
			}
		}

		Item {

			height: 3;
			width: parent.width;
		}

		DMAreaButton {

			id: oButtonMainMenu;
			pID: "ButtonMainMenu";
			width: oTopBar.width * 5;
			height: oButtonMainMenu.width * 0.89
			anchors.horizontalCenter: parent.horizontalCenter;
			color: AColors.mTransparent();
			pDeclareAction: false;

			pMouseArea.onPressed: {

				oRoot.state = "Hover";
			}

			pMouseArea.onReleased: {

				oRoot.state = "Active";
			}

			pMouseArea.onClicked: {

				oStackView.push(oScreenMenu);
			}

			Rectangle {

				id: oSeparator;
				width: parent.width * 0.73;
				height: oRoot.pTopBarLineHeight;
				color: AColors.mGetString("DeepBlue");
				anchors.horizontalCenter: parent.horizontalCenter;
			}

			Image {

				id: oImageMainMenu;
				height: parent.height * 0.69;
				fillMode: Image.PreserveAspectFit;
				anchors.top: parent.top;
				anchors.topMargin: 11;
				anchors.horizontalCenter: parent.horizontalCenter;
			}
		}
	}
}
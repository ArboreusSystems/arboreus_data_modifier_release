// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/06/2026 at 12:51:05
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;

// Application includes
import UIDataModifierMobile;


// Component
Rectangle {

	property real pHeight: AUIConfig.mElementHeight();

	id: oRoot;
	height: AUIConfig.mElementHeight() * 2.27;
	color: AColors.mGetString("BlackLight");

	DMSignLineLeft {

		id: oSignLineLeft;
		height: oRoot.pHeight;
		anchors.left: parent.left;
		anchors.verticalCenter: parent.verticalCenter;
	}

	Item {

		id: oLogoWrapper;
		height: oSignLineLeft.height * 0.91;
		width: height * oImageLogo.sourceSize.width / oImageLogo.sourceSize.height * 0.91;
		anchors.left: oSignLineLeft.right;
		anchors.leftMargin: oSignLineLeft.width * 0.67;
		anchors.verticalCenter: oSignLineLeft.verticalCenter;

		Image {

			id: oImageLogo;
			source: "qrc:/Resources/Images/Logo/DM_LogoMainMenu.svg";
			fillMode: Image.PreserveAspectFit;
			anchors.fill: parent;
		}
	}

	DMButtonAuxiliary {

		id: oButtonCloseMenu;
		pID: "ButtonCloseMenu";
		pSourceActive: "qrc:/Resources/Images/Button/Cancel/DM_ButtonCancelMainMenu_active.svg";
		pSourceHover: "qrc:/Resources/Images/Button/Cancel/DM_ButtonCancelMainMenu_hover.svg";
		pDeclareAction: false;
		height: 25;
		width: 25;
		anchors.right: oSignLineRight.left;
		anchors.rightMargin: 20;
		anchors.verticalCenter: parent.verticalCenter;

		pMouseArea.onClicked: {

			oStackView.pop();
		}
	}

	DMSignLineRight {

		id: oSignLineRight;
		height: oRoot.pHeight;
		anchors.right: parent.right;
		anchors.verticalCenter: parent.verticalCenter;
	}
}

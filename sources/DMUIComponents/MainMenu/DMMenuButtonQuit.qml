// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/07/2026 at 10:04:44
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes
import UIDataModifierMobile;


// Component
DMMenuButton {

	id: oRoot;
	pID: "ButtonQuitApplication"
	pDeclareAction: true;
	state: "Active";

	pImageActive: "qrc:/Resources/Images/Button/MainMenu/DM_ButtonMainMenuQuit_active.svg";
	pImageHover: "qrc:/Resources/Images/Button/MainMenu/DM_ButtonMainMenuQuit_hover.svg";

	pImage.visible: true;
	pImage.width: 25;
	pImage.height: 25;

	pButton.pMouseArea.onClicked: {

		AClipboard.mClear();
		AApplication.mQuit();
	}
}

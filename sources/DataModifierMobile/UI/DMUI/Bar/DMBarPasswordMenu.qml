// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/07/2026 at 20:06:22
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Layouts;

// Application includes
import UIDataModifierMobile;


// Component
Rectangle {

	property alias pButtonPasswordFromClipboard: oButtonPasswordFromClipboard.pMouseArea;
	property alias pButtonPasswordToClipboard: oButtonPasswordToClipboard.pMouseArea;
	property alias pButtonPasswordDelete: oButtonPasswordDelete.pMouseArea;

	id: oRoot;
	visible: false;

	gradient: Gradient {

		orientation: Gradient.Vertical;

		GradientStop {position: 0.0; color: AColors.mGetString("BlackLight");}
		GradientStop {position: 1.0; color: AColors.mGetString("GreyDarkest");}
	}

	RowLayout {

		id: oRowMenuWrapper;
		width: parent.width;
		anchors.bottom: parent.bottom;
		anchors.bottomMargin: 3;
		anchors.horizontalCenter: parent.horizontalCenter;

		RowLayout {

			id: oRowMen
			spacing: 15;
			Layout.alignment: Qt.AlignHCenter;

			DMButtonPasswordMenu {

				id: oButtonPasswordFromClipboard;
				width: 30;
				pID: "ButtonPasswordFromClipboard";
				pSourceActive: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordCopyFromClipboard.svg";
				pSourceHover: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordHover.svg";
			}

			DMButtonPasswordMenu {

				id: oButtonPasswordToClipboard;
				width: 30;
				pID: "ButtonPasswordToClipboard";
				pSourceActive: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordCopyToClipboard.svg";
				pSourceHover: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordHover.svg";
			}

			DMButtonPasswordMenu {

				id: oButtonPasswordDelete;
				width: 30;
				pID: "ButtonPasswordDelete";
				pSourceActive: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordDelete.svg";
				pSourceHover: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordHover.svg";
			}
		}
	}
}

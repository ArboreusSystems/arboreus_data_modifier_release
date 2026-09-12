// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/05/2026 at 15:37:15
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 6.8;

// Application includes
import UIDataModifierMobile;


// Component
Rectangle {

	id: oRoot;

	Image {

		id: oSign;
		source: "qrc:/Resources/Images/Elements/DM_SignFooterPassword_active.svg";
		height: oRoot.height;
		width: oRoot.height / 11 * 9;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.left: parent.left;
	}

	DMTextInputPassword {

		id: oInputPassword;
		height: oRoot.height;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.left: oSign.right;
		anchors.leftMargin: 10;
		anchors.right: parent.right;

		pInput.onActiveFocusChanged: {

			if (oInputPassword.pInput.activeFocus) {
				oRoot.state = "hover";
			} else {
				oRoot.state = "active";
			}
		}
	}

	Component.onCompleted: {

		oRoot.state = "active"
	}

	states: [

		State {

			name: "active";
			PropertyChanges {

				target: oRoot;
				color: AColors.mTransparent();
			}
			PropertyChanges {

				target: oSign;
				source: "qrc:/Resources/Images/Elements/DM_SignFooterPassword_active.svg";
			}
		},

		State {

			name: "hover";
			PropertyChanges {

				target: oRoot;
				color: AColors.mGetString("DeepBlueLight");
			}
			PropertyChanges {

				target: oSign;
				source: "qrc:/Resources/Images/Elements/DM_SignFooterPassword_hover.svg";
			}
		}
	]
}

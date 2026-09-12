// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/07/2026 at 01:11:34
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes
import UIDataModifierMobile;


// Component
DMAreaButton {

	property bool pAccept: false;

	id: oRoot;
	pID: "ButtonPasswordMenu";
	state: "Active";

	states: [

		State {

			name: "Active";

			PropertyChanges {

				target: oImageButtonPassword;
				source: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordSign.svg";
			}
		},

		State {

			name: "Accept";

			PropertyChanges {

				target: oImageButtonPassword;
				source: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordSignAccept.svg";
			}
		},

		State {

			name: "Hover";

			PropertyChanges {

				target: oImageButtonPassword;
				source: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordSign_hover.svg";
			}
		}
	]

	pMouseArea.onPressed: {

		oRoot.state = "Hover";
	}

	pMouseArea.onReleased: {

		oRoot.state = oRoot.pAccept ? "Accept" : "Active";
	}

	Image {

		id: oImageButtonPassword;
		height: oRoot.height * sourceSize.height / sourceSize.width;
		width: oRoot.width * sourceSize.width / sourceSize.height;
		fillMode: Image.PreserveAspectFit;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
	}
}

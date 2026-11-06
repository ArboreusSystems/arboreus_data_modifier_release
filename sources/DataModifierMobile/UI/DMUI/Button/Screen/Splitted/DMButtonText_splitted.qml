// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/08/2026 at 13:51:58
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

	property alias pLabel: oLabel;
	property string pColorActive: "red";
	property string pColorHover: "green";

	id: oRoot;
	color: oRoot.pColorActive;
	state: "Active";

	states: [

		State {

			name: "Active";

			PropertyChanges {

				target: oRoot;
				color: oRoot.pColorActive;
			}
		},

		State {

			name: "Hover";

			PropertyChanges {

				target: oRoot;
				color: oRoot.pColorHover;
			}
		}
	]

	pMouseArea.onPressed: {

		oRoot.state = "Hover";
	}

	pMouseArea.onReleased: {

		oRoot.state = "Active";
	}

	DMText {

		id: oLabel;
		text: "Label";
		font.bold: true;
		font.pixelSize: 14;
		color: AColors.mGetString("WhiteLight");
	}
}

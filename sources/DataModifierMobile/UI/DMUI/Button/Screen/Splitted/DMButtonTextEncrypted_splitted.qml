// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/08/2026 at 15:31:40
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Shapes;

// Application includes
import UIDataModifierMobile;


// Component
DMButtonText_splitted {

	id: oRoot;
	pID: "ButtonEncryptedText";
	pLabel.text: "ENCRYPTED";
	pLabel.horizontalAlignment: Text.AlignLeft;
	pLabel.anchors.left: oRoot.left;
	pLabel.anchors.leftMargin: oRoot.height;
	pLabel.anchors.verticalCenter: oRoot.verticalCenter;
	pColorActive: AColors.mGetString("Blue");
	pColorHover: AColors.mGetString("Salad");

	states: [

		State {

			name: "Default";

			PropertyChanges {

				target: oSign;
				visible: false;
			}

		},

		State {

			name: "Selected";

			PropertyChanges {

				target: oSign;
				visible: true;
			}

			PropertyChanges {

				target: oRoot;
				pColorActive: AColors.mGetString("Blue");
				pColorHover: AColors.mGetString("Salad");
			}
		}
	]

	Rectangle {

		id: oSign;
		width: parent.height * 0.44;
		height: oSign.width;
		color: AColors.mGetString("OrangeLight");
		anchors.right: parent.right;
		anchors.rightMargin: parent.height * 0.88;
		anchors.verticalCenter: parent.verticalCenter;
	}
}
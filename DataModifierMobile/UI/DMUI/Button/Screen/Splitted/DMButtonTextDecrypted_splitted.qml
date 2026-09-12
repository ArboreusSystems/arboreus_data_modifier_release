// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/08/2026 at 15:28:37
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
	pID: "ButtonDecryptedText";
	pLabel.text: "DECRYPTED";
	pLabel.horizontalAlignment: Text.AlignRight;
	pLabel.anchors.right: oRoot.right;
	pLabel.anchors.rightMargin: oRoot.height;
	pLabel.anchors.verticalCenter: oRoot.verticalCenter;
	pColorActive: AColors.mGetString("Purple");
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
		}
	]

	ACircle {

		id: oSign;
		width: parent.height * 0.44;
		height: oSign.width;
		color: AColors.mGetString("OrangeLight");
		anchors.left: parent.left;
		anchors.leftMargin: parent.height * 0.88;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.verticalCenterOffset: -1;
	}
}

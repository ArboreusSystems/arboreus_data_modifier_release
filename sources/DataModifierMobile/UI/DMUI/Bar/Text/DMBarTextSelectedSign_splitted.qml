// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/08/2026 at 10:56:19
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;

// Application includes


// Component
Item {

	id: oSignTextSelected;
	state: "Decrypted";

	states: [

		State {

			name: "Encrypted";

			PropertyChanges {

				target: oSelectedDecrypted;
				visible: false;
			}

			PropertyChanges {

				target: oSelectedEncrypted;
				visible: true;
			}
		},

		State {

			name: "Decrypted";

			PropertyChanges {

				target: oSelectedDecrypted;
				visible: true;
			}

			PropertyChanges {

				target: oSelectedEncrypted;
				visible: false;
			}
		}
	]

	Image {


		id: oSelectedDecrypted;
		width: parent.width * 0.9;
		height: parent.height;
		source: "qrc:/Resources/Images/Elements/DM_SignTextSelectedLeft.svg";
		anchors.left: parent.left;
		anchors.bottom: parent.bottom;
		visible: false;
	}

	Image {

		id: oSelectedEncrypted;
		width: parent.width * 0.9;
		height: parent.height;
		source: "qrc:/Resources/Images/Elements/DM_SignTextSelectedRight.svg";
		anchors.right: parent.right;
		anchors.bottom: parent.bottom;
		visible: false;
	}
}

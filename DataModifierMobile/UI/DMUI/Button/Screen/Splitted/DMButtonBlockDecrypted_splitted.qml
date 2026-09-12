// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/08/2026 at 17:09:28
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick

// Application includes
import UIDataModifierMobile;


// Component
Item  {

	property alias pButtonDecrypt: oButtonDecrypt;
	property alias pButtonPasteAndDecrypt: oButtonPasteAndDecrypt;

	id: oRoot;
	height: 100;
	state: "Decrypt";

	states: [

		State {

			name: "Decrypt";

			PropertyChanges {

				target: oButtonDecrypt;
				visible: true;
			}

			PropertyChanges {

				target: oButtonPasteAndDecrypt;
				visible: false;
			}
		},

		State {

			name: "PasteAndDecrypt";

			PropertyChanges {

				target: oButtonDecrypt;
				visible: false;
			}

			PropertyChanges {

				target: oButtonPasteAndDecrypt;
				visible: true;
			}
		}
	]

	Component.onCompleted: {

		oRoot.mSetState(ASettings.mGetValue("SwitchDecryptFromClipbard"));
	}

	DMButtonDecrypt_splitted {

		id: oButtonDecrypt;
		width: oRoot.height * 0.55;
		anchors.top: parent.top;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.horizontalCenterOffset: 10;
	}

	DMButtonPasteAndDecrypt_splitted {

		id: oButtonPasteAndDecrypt;
		width: oRoot.height;
		anchors.top: parent.top;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.horizontalCenterOffset: 10;
	}

	Connections {

		target: ASettings;

		function onSgSetValue(inKey,inValue) {

			if (inKey === "SwitchDecryptFromClipbard") {
				oRoot.mSetState(inValue);
			}
		}
	}

	function mSetState(inSwitchMode) {

		if (inSwitchMode) {
			oRoot.state = "PasteAndDecrypt";
		} else {
			oRoot.state = "Decrypt";
		}
	}
}

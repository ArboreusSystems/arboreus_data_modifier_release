// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/08/2026 at 17:10:34
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick

// Application includes
import UIDataModifierMobile;


// Component
Item  {

	property alias pButtonEncryptAndCopy: oButtonEncryptAndCopy;
	property alias pButtonEncrypt: oButtonEncrypt;

	id: oRoot;
	height: 100;
	state: "Encrypt";

	states: [

		State {

			name: "Encrypt";

			PropertyChanges {

				target: oButtonEncrypt;
				visible: true;
			}

			PropertyChanges {

				target: oButtonEncryptAndCopy;
				visible: false;
			}
		},

		State {

			name: "EncryptAndCopy";

			PropertyChanges {

				target: oButtonEncrypt;
				visible: false;
			}

			PropertyChanges {

				target: oButtonEncryptAndCopy;
				visible: true;
			}
		}
	]

	Component.onCompleted: {

		oRoot.mSetState(ASettings.mGetValue("SwitchEncryptToClipbard"));
	}

	DMButtonEncryptAndCopy_splitted {

		id: oButtonEncryptAndCopy;
		width: oRoot.height - 2;
		anchors.top: parent.top;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.horizontalCenterOffset: -10;
	}

	DMButtonEncrypt_splitted {

		id: oButtonEncrypt;
		width: oRoot.height * 0.55 - 2;
		anchors.top: parent.top;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.horizontalCenterOffset: -10;
	}

	Connections {

		target: ASettings;

		function onSgSetValue(inKey,inValue) {

			if (inKey === "SwitchEncryptToClipbard") {
				oRoot.mSetState(inValue);
			}
		}
	}

	function mSetState(inSwitchMode) {

		if (inSwitchMode) {
			oRoot.state = "EncryptAndCopy";
		} else {
			oRoot.state = "Encrypt";
		}
	}
}

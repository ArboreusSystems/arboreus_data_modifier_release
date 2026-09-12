// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/08/2026 at 09:20:57
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.VectorImage;
import QtQuick.Layouts;

// Application includes
import UIDataModifierMobile;


// Component
Item {

	property int pTopBarHeight: 20;
	property int pTopBarLineHeight: 2;
	property alias pButtonEncrypt: oButtonEncrypt;
	property alias pButtonEncryptAndCopy: oButtonEncryptAndCopy;

	id: oRoot;

	states: [

		State {

			name: "Encrypt";

			PropertyChanges {

				target: oButtonEncryptWrapper;
				visible: true;
			}

			PropertyChanges {

				target: oButtonEncryptAndCopyWrapper;
				visible: false;
			}
		},

		State {

			name: "EncryptAndCopy";

			PropertyChanges {

				target: oButtonEncryptWrapper;
				visible: false;
			}

			PropertyChanges {

				target: oButtonEncryptAndCopyWrapper;
				visible: true;
			}
		}
	]

	Component.onCompleted: {

		oRoot.mSetState(ASettings.mGetValue("SwitchEncryptToClipbard"));
	}

	Rectangle {

		id: oTopBar;
		height: oRoot.pTopBarHeight;
		anchors.top: parent.top;
		anchors.right: parent.right;
		anchors.left: parent.left;
		color: AColors.mGetString("Blue");
	}

	Item {

		id: oButtonWraper;
		width: parent.width * 0.73;
		height: parent.height;
		anchors.right: parent.right;
		anchors.top: oTopBar.bottom;

		Item {

			id: oSign;
			height: 15;
			width: 20;
			anchors.left: parent.left;
			anchors.leftMargin: oRoot.width * 0.21;
			anchors.top: oButtonWraper.top;
			clip: true;

			Image {

				id: oSignImage;
				width: parent.width;
				height: width * 1.31;
				source: "qrc:/Resources/Images/Button/MainMenu/DM_ButtonMainMenuSign_Encrypt.svg";
				fillMode: Image.PreserveAspectFit;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.bottom: parent.bottom;
			}
		}

		Item {

			id: oButtonEncryptWrapper;
			visible: false;
			width: parent.width * 0.5;
			height: parent.height;
			anchors.horizontalCenter: oSign.horizontalCenter;
			anchors.top: oSign.bottom;
			anchors.topMargin: 3;

			DMAreaButton {

				id: oButtonEncrypt;
				pID: "ButtonEncrypt";
				width: 51;
				height: 51;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.top: parent.top;
				color: AColors.mGetString("Blue");

				pMouseArea.onPressed: {

					oImageButtonEncrypt.source = "qrc:/Resources/Images/Button/Modifier/DM_ButtonHoverSmall.svg";
					oButtonEncrypt.color = AColors.mGetString("Salad");
					oButtonEncryptLabel.color = AColors.mGetString("Salad");
				}

				pMouseArea.onReleased: {

					oImageButtonEncrypt.source = "qrc:/Resources/Images/Button/Modifier/DM_ButtonEncrypt.svg";
					oButtonEncrypt.color = AColors.mGetString("Blue");
					oButtonEncryptLabel.color = AColors.mGetString("Blue");
				}

				Image {

					id: oImageButtonEncrypt;
					width: parent.width * 0.70;
					height: parent.height * 0.70;
					source: "qrc:/Resources/Images/Button/Modifier/DM_ButtonEncrypt.svg";
					anchors.horizontalCenter: parent.horizontalCenter;
					anchors.verticalCenter: parent.verticalCenter;
				}
			}

			DMText {

				id: oButtonEncryptLabel;
				width: parent.width * 1.3;
				text: "ENCRYPT";
				font.pixelSize: 11;
				font.bold: true;
				color: AColors.mGetString("Blue");
				horizontalAlignment: Text.AlignHCenter;
				verticalAlignment: Text.AlignVCenter;
				anchors.top: oButtonEncrypt.bottom;
				anchors.topMargin: 3;
				anchors.horizontalCenter: parent.horizontalCenter;
			}
		}

		Item {

			id: oButtonEncryptAndCopyWrapper;
			visible: false;
			width: parent.width * 0.59;
			height: parent.height;
			anchors.horizontalCenter: oSign.horizontalCenter;
			anchors.top: oSign.bottom;
			anchors.topMargin: 3;

			DMAreaButton {

				id: oButtonEncryptAndCopy;
				pID: "ButtonEncryptAndCopy";
				width: 89;
				height: 51;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.top: parent.top;
				color: AColors.mGetString("Blue");

				pMouseArea.onPressed: {

					oImageButtonEncryptAndCopy.source = "qrc:/Resources/Images/Button/Modifier/DM_ButtonHoverBig.svg";
					oButtonEncryptAndCopy.color = AColors.mGetString("Salad");
					oButtonEncryptAndCopyLabel.color = AColors.mGetString("Salad");
				}

				pMouseArea.onReleased: {

					oImageButtonEncryptAndCopy.source = "qrc:/Resources/Images/Button/Modifier/DM_ButtonEncryptAndCopy.svg";
					oButtonEncryptAndCopy.color = AColors.mGetString("Blue");
					oButtonEncryptAndCopyLabel.color = AColors.mGetString("Blue");
				}

				Image {

					id: oImageButtonEncryptAndCopy;
					width: parent.width * 0.70;
					height: parent.height * 0.70;
					fillMode: Image.PreserveAspectFit;
					source: "qrc:/Resources/Images/Button/Modifier//DM_ButtonEncryptAndCopy.svg";
					anchors.horizontalCenter: parent.horizontalCenter;
					anchors.verticalCenter: parent.verticalCenter;
				}
			}

			DMText {

				id: oButtonEncryptAndCopyLabel;
				width: parent.width * 1.3;
				text: "ENCRYPT & COPY";
				font.pixelSize: 11;
				font.bold: true;
				color: AColors.mGetString("Blue");
				horizontalAlignment: Text.AlignHCenter;
				verticalAlignment: Text.AlignVCenter;
				anchors.top: oButtonEncryptAndCopy.bottom;
				anchors.topMargin: 3;
				anchors.horizontalCenter: parent.horizontalCenter;
			}
		}
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

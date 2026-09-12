// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/08/2026 at 08:36:08
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes
import UIDataModifierMobile;


// Component
Item {

	property int pTopBarHeight: 20;
	property int pTopBarLineHeight: 2;
	property alias pButtonDecrypt: oButtonDecrypt;
	property alias pButtonPasteAndDecrypt: oButtonPasteAndDecrypt;

	id: oRoot;

	states: [

		State {

			name: "Decrypt";

			PropertyChanges {

				target: oButtonDecryptWrapper;
				visible: true;
			}

			PropertyChanges {

				target: oButtonPasteAndDecryptWrapper;
				visible: false;
			}

			PropertyChanges {

				target: oSign;
				anchors.horizontalCenterOffset: oRoot.width * 0.31;
			}
		},

		State {

			name: "PasteAndDecrypt";

			PropertyChanges {

				target: oButtonDecryptWrapper;
				visible: false;
			}

			PropertyChanges {

				target: oButtonPasteAndDecryptWrapper;
				visible: true;
			}

			PropertyChanges {

				target: oSign;
				anchors.horizontalCenterOffset: oRoot.width * 0.23;
			}
		}
	]

	Component.onCompleted: {

		oRoot.mSetState(ASettings.mGetValue("SwitchDecryptFromClipbard"));
	}

	Rectangle {

		id: oTopBar;
		height: oRoot.pTopBarHeight;
		anchors.top: parent.top;
		anchors.right: parent.right;
		anchors.left: parent.left;
		color: AColors.mGetString("Purple");
	}

	Item {

		id: oButtonWraper;
		width: parent.width * 0.73;
		height: parent.height;
		anchors.left: parent.left;
		anchors.top: oTopBar.bottom;

		Item {

			id: oSign;
			height: 15;
			width: 20;
			anchors.right: parent.right;
			anchors.rightMargin: oRoot.width * 0.21;
			anchors.top: oButtonWraper.top;
			clip: true;

			Image {

				id: oSignImage;
				width: parent.width;
				height: width * 1.31;
				source: "qrc:/Resources/Images/Button/MainMenu/DM_ButtonMainMenuSign_Decrypt.svg";
				fillMode: Image.PreserveAspectFit;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.bottom: parent.bottom;
			}
		}

		Item {

			id: oButtonDecryptWrapper;
			visible: false;
			width: parent.width * 0.5;
			height: parent.height;
			anchors.horizontalCenter: oSign.horizontalCenter;
			anchors.top: oSign.bottom;
			anchors.topMargin: 3;

			DMAreaButton {

				id: oButtonDecrypt;
				pID: "ButtonDecrypt";
				width: 51;
				height: 51;
				radius: oButtonDecrypt.height * 0.5;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.top: parent.top;
				color: AColors.mGetString("Purple");

				pMouseArea.onPressed: {

					oImageButtonDecrypt.source = "qrc:/Resources/Images/Button/Modifier/DM_ButtonHoverSmall.svg";
					oButtonDecrypt.color = AColors.mGetString("Salad");
					oButtonDecryptLabel.color = AColors.mGetString("Salad");
				}

				pMouseArea.onReleased: {

					oImageButtonDecrypt.source = "qrc:/Resources/Images/Button/Modifier/DM_ButtonDecrypt.svg";
					oButtonDecrypt.color = AColors.mGetString("Purple");
					oButtonDecryptLabel.color = AColors.mGetString("Purple");
				}

				Image {

					id: oImageButtonDecrypt;
					width: parent.width * 0.70;
					height: parent.height * 0.70;
					source: "qrc:/Resources/Images/Button/Modifier/DM_ButtonDecrypt.svg";
					anchors.horizontalCenter: parent.horizontalCenter;
					anchors.verticalCenter: parent.verticalCenter;
				}
			}

			DMText {

				id: oButtonDecryptLabel;
				width: parent.width * 1.3;
				text: "DECRYPT";
				font.pixelSize: 11;
				font.bold: true;
				color: AColors.mGetString("Purple");
				horizontalAlignment: Text.AlignHCenter;
				verticalAlignment: Text.AlignVCenter;
				anchors.top: oButtonDecrypt.bottom;
				anchors.topMargin: 3;
				anchors.horizontalCenter: parent.horizontalCenter;
			}
		}

		Item {

			id: oButtonPasteAndDecryptWrapper;
			visible: false;
			width: parent.width * 0.5;
			height: parent.height;
			anchors.horizontalCenter: oSign.horizontalCenter;
			anchors.top: oSign.bottom;
			anchors.topMargin: 3;

			DMAreaButton {

				id: oButtonPasteAndDecrypt;
				pID: "ButtonPasteAndDecrypt";
				width: 99;
				height: 51;
				radius: oButtonPasteAndDecrypt.height * 0.5;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.top: parent.top;
				color: AColors.mGetString("Purple");

				pMouseArea.onPressed: {

					oImageButtonPasteAndDecrypt.source = "qrc:/Resources/Images/Button/Modifier/DM_ButtonHoverBig.svg";
					oButtonPasteAndDecrypt.color = AColors.mGetString("Salad");
					oButtonPasteAndDecryptLabel.color = AColors.mGetString("Salad");
				}

				pMouseArea.onReleased: {

					oImageButtonPasteAndDecrypt.source = "qrc:/Resources/Images/Button/Modifier/DM_ButtonPasteAndDecrypt.svg";
					oButtonPasteAndDecrypt.color = AColors.mGetString("Purple");
					oButtonPasteAndDecryptLabel.color = AColors.mGetString("Purple");
				}

				Image {

					id: oImageButtonPasteAndDecrypt;
					width: parent.width * 0.70;
					height: parent.height * 0.70;
					fillMode: Image.PreserveAspectFit;
					source: "qrc:/Resources/Images/Button/Modifier/DM_ButtonPasteAndDecrypt.svg";
					anchors.horizontalCenter: parent.horizontalCenter;
					anchors.verticalCenter: parent.verticalCenter;
				}
			}

			DMText {

				id: oButtonPasteAndDecryptLabel;
				width: parent.width * 1.3;
				text: "PASTE & DECRYPT";
				font.pixelSize: 11;
				font.bold: true;
				color: AColors.mGetString("Purple");
				horizontalAlignment: Text.AlignHCenter;
				verticalAlignment: Text.AlignVCenter;
				anchors.top: oButtonPasteAndDecrypt.bottom;
				anchors.topMargin: 3;
				anchors.horizontalCenter: parent.horizontalCenter;
			}
		}
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

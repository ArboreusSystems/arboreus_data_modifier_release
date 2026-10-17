// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/08/2026 at 15:58:06
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes
import UIDataModifierMobile;
import AEnums;


// Component
Item {

	required property DMScreen pScreen;

	id: oRoot;
	anchors.top: parent.top;
	anchors.bottom: parent.bottom;
	anchors.left: parent.left;
	anchors.right: parent.right;

	DMBarText_all_in_one {

		id: oTextEditWrapper;
		width: parent.width;
		anchors.top: parent.top;
		anchors.bottom: oMenuAction.top;
		anchors.left: parent.left;
		anchors.right: parent.right;

		pTextEdit.onActiveFocusChanged: {

			if (oTextEditWrapper.pTextEdit.activeFocus) {
				oBarPassword.visible = false;
				oMenuAction.anchors.bottomMargin = 0;
			} else {
				oBarPassword.visible = true;
				oMenuAction.anchors.bottomMargin = oBarPassword.height;
			}
		}

		pButtonCopy.pMouseArea.onClicked: {

			oRoot.pScreen.mShowNotification(qsTrId("DM.Data.Copied"),"Regular");
		}

		pButtonPaste.pMouseArea.onClicked: {

			oRoot.pScreen.mShowNotification(qsTrId("DM.Data.Pasted"),"Regular");
		}

		pButtonDelete.pMouseArea.onClicked: {

			oRoot.pScreen.mShowNotification(qsTrId("DM.Data.Deleted"),"Regular");
		}
	}

	Item {

		property int pTopBarHeight: 8;
		property int pTopBarLineHeight: 2;

		id: oMenuAction;
		width: parent.width;
		height: oBarPassword.height * 2.35;
		anchors.bottom: parent.bottom;
		anchors.bottomMargin: oBarPassword.height;

		Rectangle {

			id: oMenuActionBackground;
			width: parent.width;
			height: parent.height - oSignAction.height;
			anchors.top: parent.top;
			anchors.horizontalCenter: parent.horizontalCenter;

			gradient: Gradient {

			orientation: Gradient.Vertical;

				GradientStop {position: 0.0; color: AColors.mGetString("WhiteLight");}
				GradientStop {position: 1.0; color: AColors.mGetString("WhiteDark");}
			}
		}

		DMButtonDecrypt_all_in_one {

			id: oButtonDecrypt;

			width: parent.width * 0.5;
			anchors.left: parent.left;
			height: oButtonMainMenu.height;
			pTopBarHeight: oMenuAction.pTopBarHeight;
			pTopBarLineHeight: oMenuAction.pTopBarLineHeight;

			pButtonDecrypt.pMouseArea.onClicked: {

				oRoot.forceActiveFocus();
				oButtonDecrypt.mDecrypt();
			}

			pButtonPasteAndDecrypt.pMouseArea.onClicked: {

				oRoot.forceActiveFocus();
				oTextEditWrapper.pTextEdit.text = AClipboard.mTextPaste();
				oButtonDecrypt.mDecrypt();
			}

			function mDecrypt() {

				if (
					oBarPassword.pPassword === "" ||
					oBarPassword.pPassword === oBarPassword.pTextDefault
				) {
					oRoot.pScreen.mShowNotification(qsTrId("DM.Password.Empty"),"Error");
					return;
				}

				if (
					oTextEditWrapper.pTextEdit.text === "" ||
					oTextEditWrapper.pTextEdit.text === oTextEditWrapper.pTextDefault
				) {
					oRoot.pScreen.mShowNotification(qsTrId("DM.Decrypted.Empty"),"Error");
					return;
				}

				var oDecryptedObject = DMCore.mDecodeString(oTextEditWrapper.pTextEdit.text);
				if (oDecryptedObject.pStatus === AEnumStatus.Ok) {
					oTextEditWrapper.pTextEdit.text = oDecryptedObject.pValue;
					DMCore.mClearOutput(oDecryptedObject);
					oDecryptedObject = {};
					oRoot.pScreen.mShowNotification(qsTrId("DM.Data.Decrypted"),"Regular");
					console.debug("Text decrypted");
				} else {
					var oMessage = qsTrId("DM.Error.SomethingWentWrong");
					if (oDecryptedObject.pStatus === -1 && oDecryptedObject.pCode === -4) {
						oMessage = qsTrId("DM.Error.WrongPassword");
					}
					oRoot.pScreen.mShowNotification(oMessage,"Error");
					console.error("Can't decrypt text");
					console.error("Status: " + oDecryptedObject.pStatus);
					console.error("Code: " + oDecryptedObject.pCode);
					console.error("Value: " + oDecryptedObject.pValue);
				}
			}
		}

		DMButtonEncrypt_all_in_one {

			id: oButtonEncrypt;
			width: parent.width * 0.5;
			anchors.right: parent.right;
			height: oButtonMainMenu.height;
			pTopBarHeight: oMenuAction.pTopBarHeight;
			pTopBarLineHeight: oMenuAction.pTopBarLineHeight;

			pButtonEncrypt.pMouseArea.onClicked: {

				oRoot.forceActiveFocus();
				oButtonEncrypt.mEncrypt();
			}

			pButtonEncryptAndCopy.pMouseArea.onClicked: {

				oRoot.forceActiveFocus();

				if (oButtonEncrypt.mEncrypt()) {
					if (ASettings.mGetValue("SwitchClipboardClear")) {
						AClipboard.mTextCopyPrivateAndClear(
							oTextEditWrapper.pTextEdit.text,
							ASettings.mGetValue("SwitchClipboardClearTimeout")
						);
					} else {
						AClipboard.mTextCopyPrivate(
							oTextEditWrapper.pTextEdit.text
						);
					}
				}
			}

			function mEncrypt() {

				if (
					oBarPassword.pPassword === "" ||
					oBarPassword.pPassword === oBarPassword.pTextDefault
				) {
					oRoot.pScreen.mShowNotification(qsTrId("DM.Password.Empty"),"Error");
					return false;
				}

				if (Qt.inputMethod.visible) Qt.inputMethod.hide();
				if (oTextEditWrapper.pTextEdit.activeFocus) oTextEditWrapper.forceActiveFocus();

				if (
					oTextEditWrapper.pTextEdit.text === "" ||
					oTextEditWrapper.pTextEdit.text === oTextEditWrapper.pTextDefault
				) {
					oRoot.pScreen.mShowNotification(qsTrId("DM.Encrypted.Empty"),"Error");
					return false;
				}

				var oEncryptedObject = DMCore.mEncodeString(oTextEditWrapper.pTextEdit.text);
				if (oEncryptedObject.pStatus === AEnumStatus.Ok) {
					oTextEditWrapper.pTextEdit.text = oEncryptedObject.pValue;
					DMCore.mClearOutput(oEncryptedObject);
					oEncryptedObject = {};
					oRoot.pScreen.mShowNotification(qsTrId("DM.Data.Encrypted"),"Regular");
					console.debug("Text encrypted");
					return true;
				} else {
					var oMessage = qsTrId("DM.Error.SomethingWentWrong");
					oRoot.pScreen.mShowNotification(oMessage,"Error");
					console.error("Can't encrypt text");
					console.error("Status: " + oEncryptedObject.pStatus);
					console.error("Code: " + oEncryptedObject.pCode);
					console.error("Value: " + oEncryptedObject.pValue);
					return false;
				}
			}
		}

		DMButtonMainMenu_all_in_one {

			id: oButtonMainMenu;
			anchors.top: parent.top;
			anchors.horizontalCenter: parent.horizontalCenter;

			pTopBarHeight: oMenuAction.pTopBarHeight;
			pTopBarLineHeight: oMenuAction.pTopBarLineHeight;
		}
	}

	DMBarPassword {

		id: oBarPassword;
		width: oSignAction.width;
		anchors.bottom: parent.bottom;
		anchors.bottomMargin: oSignAction.height;
		anchors.horizontalCenter: parent.horizontalCenter;

		pTextInput.onActiveFocusChanged: {

			if (oBarPassword.pTextInput.activeFocus) {
				oMenuAction.visible = false;
				oBarPasswordMenu.visible = true;
			} else {
				oMenuAction.visible = true;
				oBarPasswordMenu.visible = false;
			}
		}
	}

	DMBarPasswordMenu {

		id: oBarPasswordMenu;
		width: oSignAction.width;
		anchors.top: oRoot.top;
		anchors.bottom: oBarPassword.top;
		anchors.horizontalCenter: parent.horizontalCenter;

		pButtonPasswordFromClipboard.onClicked: {

			oBarPassword.pTextInput.text = AClipboard.mTextPaste();
			oRoot.pScreen.mShowNotification(qsTrId("DM.Password.Pasted"),"Password");
			console.debug("Password copied from clipboard");
		}

		pButtonPasswordToClipboard.onClicked: {

			if (ASettings.mGetValue("ClipboardClear")) {
				AClipboard.mTextCopySensitiveToAndClear(
					oBarPassword.pTextInput.text,
					ASettings.mGetValue("ClipboardClearTimeout")
				);
			} else {
				AClipboard.mTextCopySensitiveTo(
					oBarPassword.pTextInput.text
				);
			}

			oRoot.pScreen.mShowNotification(qsTrId("DM.Password.Copied"),"Password");
			console.debug("Password copied to clipboard");
		}

		pButtonPasswordDelete.onClicked: {

			var oPasswordDelete = DMCore.mPasswordDelete();
			if (oPasswordDelete.pStatus === AEnumStatus.Ok) {
				oBarPassword.pTextInput.text = "";
				oRoot.pScreen.mShowNotification(qsTrId("DM.Password.Deleted"),"Password");
				console.debug("Password deleted");
			} else {
				oRoot.pScreen.mShowNotification(qsTrId("DM.Error.SomethingWentWrong"),"Error");
				console.error("Can't delete password");
			}
		}
	}

	DMSignAction {

		id: oSignAction;
		anchors.bottom: parent.bottom;
		anchors.horizontalCenter: parent.horizontalCenter;
		visible: true;

		Connections {

			target: AApplication;

			function onSgDeclareAction(inAction) {

				if (oStackView.currentItem === oRoot.pScreen) oSignAction.mRegenerate();
			}
		}

		Connections {

			target: oMainWindow;

			function onSgKeyboardVisible(inVisibility) {

				if (inVisibility) {
					oSignAction.visible = false;
				} else {
					oSignAction.visible = true;
				}
			}
		}
	}
}

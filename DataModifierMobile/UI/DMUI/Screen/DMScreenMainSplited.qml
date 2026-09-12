// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/08/2026 at 15:58:55
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

	states: [

		State {

			name: "Default";

			PropertyChanges {

				target: oSignTextSelected;
				visible: true;
			}

			PropertyChanges {

				target: oTextField;
				visible: true;
			}

			PropertyChanges {

				target: oMenuAction;
				visible: true;
				anchors.bottomMargin: oBarPassword.height;
			}

			PropertyChanges {

				target: oBarPassword;
				visible: true;
				state: "Default";
			}

			PropertyChanges {

				target: oGradientWrapper;
				visible: false;
			}
		},

		State {

			name: "DecryptedActiveFocus";

			PropertyChanges {

				target: oMenuAction;
				visible: true;
				anchors.bottomMargin: 0;
			}

			PropertyChanges {

				target: oBarPassword;
				visible: false;
				state: "Default";
			}

			PropertyChanges {

				target: oGradientWrapper;
				visible: false;
			}
		},

		State {

			name: "PasswordActiveFocus";

			PropertyChanges {

				target: oSignTextSelected;
				visible: false;
			}

			PropertyChanges {

				target: oTextField;
				visible: false;
			}

			PropertyChanges {

				target: oMenuAction;
				visible: false;
				anchors.bottomMargin: 0;
			}

			PropertyChanges {

				target: oBarPassword;
				visible: true;
				state: "ActiveFocus";
			}

			PropertyChanges {

				target: oGradientWrapper;
				visible: true;
			}
		}
	]

	StackView.onStatusChanged: {

		if (StackView.status === StackView.Active) {

			if (oBarPassword.pTextInput.text === oBarPassword.pTextDefault) {
				oBarPassword.pTextDefault = qsTrId("DM.Password.Default");
				oBarPassword.pTextInput.text = oBarPassword.pTextDefault
			}
		}
	}

	Rectangle {

		id: oGradientWrapper;
		visible: false;
		anchors.fill: parent;

		gradient: Gradient {

			orientation: Gradient.Vertical;

			GradientStop {position: 0.0; color: AColors.mGetString("BlackLight");}
			GradientStop {position: 1.0; color: AColors.mGetString("GreyDarkest");}
		}
	}

	Item {

		id: oTextField;
		anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.right: parent.right;
		anchors.bottom: oMenuAction.top;

		states: [

			State {

				name: "Encrypted";

				PropertyChanges {

					target: oTextFieldEncrypted;
					visible: true;
				}

				PropertyChanges {

					target: oTextFieldDecrypted;
					visible: false;
				}
			},

			State {

				name: "Decrypted";

				PropertyChanges {

					target: oTextFieldEncrypted;
					visible: false;
				}

				PropertyChanges {

					target: oTextFieldDecrypted;
					visible: true;
				}
			}
		]

		DMBarTextEncrypted_splitted {

			id: oTextFieldEncrypted;
			anchors.fill: parent;
			pPaddingLeft: AUIConfig.mElementHeight() * 0.57;
			pPaddingRight: AUIConfig.mElementHeight() * 0.57;
			pPaddingTop: AUIConfig.mElementHeight() * 0.55;
			pPaddingBottom: AUIConfig.mElementHeight() * 1.8;
			pText.text: qsTrId("DM.Encrypted.Default");

			pButtonDelete.pMouseArea.onClicked: {

				oTextFieldEncrypted.mSetText(oTextFieldEncrypted.pTextDefault);
				oRoot.pScreen.mShowNotification(qsTrId("DM.Encrypted.Deleted"),"Regular");
			}

			pButtonPaste.pMouseArea.onClicked: {

				oTextFieldEncrypted.mSetText(AClipboard.mTextPasteFrom());
				oRoot.pScreen.mShowNotification(qsTrId("DM.Encrypted.Pasted"),"Regular");
			}

			pButtonCopy.pMouseArea.onClicked: {

				AClipboard.mTextCopyTo(oTextFieldEncrypted.pTextRaw);
				oRoot.pScreen.mShowNotification(qsTrId("DM.Encrypted.Copied"),"Regular");
			}
		}

		DMBarTextDecrypted_splitted {

			id: oTextFieldDecrypted;
			anchors.fill: parent;
			pPaddingLeft: AUIConfig.mElementHeight() * 0.57;
			pPaddingRight: AUIConfig.mElementHeight() * 0.57;
			pPaddingTop: AUIConfig.mElementHeight() * 0.55;
			pPaddingBottom: AUIConfig.mElementHeight() * 1.8;

			pTextEdit.onActiveFocusChanged: {

				if (oTextFieldDecrypted.pTextEdit.activeFocus) {
					oBarPassword.visible = false;
					oMenuAction.anchors.bottomMargin = 0;
					oSignTextSelected.visible = false;
				} else {
					oBarPassword.visible = true;
					oMenuAction.anchors.bottomMargin = oBarPassword.height;
					oSignTextSelected.visible = true;
				}
			}

			pButtonDelete.pMouseArea.onClicked: {

				if (oTextFieldDecrypted.pTextEdit.activeFocus) {
					oTextFieldDecrypted.pTextEdit.text = "";
				} else {
					oTextFieldDecrypted.pTextEdit.text = oTextFieldDecrypted.pTextDefault;
				}

				oRoot.pScreen.mShowNotification(qsTrId("DM.Decrypted.Deleted"),"Regular");
			}

			pButtonPaste.pMouseArea.onClicked: {

				oTextFieldDecrypted.pTextEdit.text = AClipboard.mTextPasteFrom();
				oRoot.pScreen.mShowNotification(qsTrId("DM.Decrypted.Pasted"),"Regular");
			}

			pButtonWrite.pMouseArea.onClicked: {

				oTextFieldDecrypted.pTextEdit.forceActiveFocus();
			}

			pButtonCopy.pMouseArea.onClicked: {

				AClipboard.mTextCopyTo(oTextFieldDecrypted.pTextEdit.text);
				oRoot.pScreen.mShowNotification(qsTrId("DM.Decrypted.Copied"),"Regular");
			}

			pButtonOk.pMouseArea.onClicked: {

				oRoot.forceActiveFocus();
			}
		}
	}

	Rectangle {

		property int pTopBarHeight: 24;
		property int pTopBarLineHeight: 2;

		id: oMenuAction;
		width: parent.width;
		height: oBarPassword.height * 2.53;
		anchors.bottom: parent.bottom;
		anchors.bottomMargin: oBarPassword.height;

		gradient: Gradient {

			orientation: Gradient.Vertical;

			GradientStop {position: 0.0; color: AColors.mGetString("WhiteLight");}
			GradientStop {position: 1.0; color: AColors.mGetString("WhiteDark");}
		}

		Component.onCompleted: {

			oMenuAction.mSelectDecrypted();
		}

		DMBarTextMenu_splitted {

			id: oBarText;
			width: parent.width;
			height: oMenuAction.pTopBarHeight;
			anchors.top: parent.top;
			anchors.left: parent.left;
			anchors.right: parent.right;

			pButtonDecryptedText.pMouseArea.onClicked: {

				oRoot.forceActiveFocus();
				oMenuAction.mSelectDecrypted();
			}

			pButtonEncryptedText.pMouseArea.onClicked: {

				oRoot.forceActiveFocus();
				oMenuAction.mSelectEncrypted();
			}
		}

		DMButtonBlockDecrypted_splitted {

			id: oButtonBlockDecrypted;
			anchors.top: oButtonMainMenu.top;
			anchors.left: parent.left;
			anchors.right: oButtonMainMenu.left;
			anchors.rightMargin: -8;

			pButtonDecrypt.pMouseArea.onClicked: {

				oRoot.forceActiveFocus();

				if (oButtonBlockDecrypted.mDecrypt(oTextFieldEncrypted.pTextRaw)) {
					oMenuAction.mSelectDecrypted();
					console.debug("pButtonDecrypt.pMouseArea.onClicked");
				}
			}

			pButtonPasteAndDecrypt.pMouseArea.onClicked: {

				oRoot.forceActiveFocus();

				var oEncryptedString = AClipboard.mTextPasteFrom();
				if (oButtonBlockDecrypted.mDecrypt(oEncryptedString)) {
					oTextFieldEncrypted.mSetText(oEncryptedString);
					oMenuAction.mSelectDecrypted();
					console.debug("pButtonPasteAndDecrypt.pMouseArea.onClicked");
				}
			}

			function mDecrypt(inEncryptedString) {

				if (
					oBarPassword.pPassword === "" ||
					oBarPassword.pPassword === oBarPassword.pTextDefault
				) {
					oRoot.pScreen.mShowNotification(qsTrId("DM.Password.Empty"),"Error");
					return false;
				}

				if (
					inEncryptedString === "" ||
					inEncryptedString === oTextFieldEncrypted.pTextDefault
				) {
					oRoot.pScreen.mShowNotification(qsTrId("DM.Encrypted.Empty"),"Error");
					return false;
				}

				var oDecryptedObject = DMCore.mDecodeString(inEncryptedString);
				if (oDecryptedObject.pStatus === AEnumStatus.Ok) {
					oTextFieldDecrypted.pTextEdit.text = oDecryptedObject.pValue;
					oRoot.pScreen.mShowNotification(qsTrId("DM.Data.Decrypted"),"Regular");
					console.debug("Text decrypted");
					return true;
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
					return false;
				}
			}
		}

		DMButtonMainMenu_splitted {

			id: oButtonMainMenu;
			width: oMenuAction.pTopBarHeight * 3.2;
			anchors.top: oBarText.bottom;
			anchors.horizontalCenter: parent.horizontalCenter;
			pTopBarHeight: oMenuAction.pTopBarHeight;
			pTopBarLineHeight: oMenuAction.pTopBarLineHeight;
		}

		DMButtonBlockEncrypted_splitted {

			id: oButtonBlockEncrypted;
			anchors.top: oButtonMainMenu.top;
			anchors.left: oButtonMainMenu.right;
			anchors.leftMargin: -8;
			anchors.right: parent.right;

			pButtonEncrypt.pMouseArea.onClicked: {

				oRoot.forceActiveFocus();

				if (oButtonBlockEncrypted.mEncrypt()) {
					oMenuAction.mSelectEncrypted();
					console.debug("pButtonDecrypt.pMouseArea.onClicked")
				}
			}

			pButtonEncryptAndCopy.pMouseArea.onClicked: {

				oRoot.forceActiveFocus();

				if (oButtonBlockEncrypted.mEncrypt()) {
					oMenuAction.mSelectEncrypted();
					AClipboard.mTextCopyTo(oTextFieldEncrypted.pTextRaw);
					console.debug("pButtonDecrypt.pMouseArea.onClicked")
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
				if (oTextFieldDecrypted.pTextEdit.activeFocus) oTextFieldDecrypted.forceActiveFocus();

				if (
					oTextFieldDecrypted.pTextEdit.text === "" ||
					oTextFieldDecrypted.pTextEdit.text === oTextFieldDecrypted.pTextDefault
				) {
					oRoot.pScreen.mShowNotification(qsTrId("DM.Decrypted.Empty"),"Error");
					return false;
				}

				var oEncryptedObject = DMCore.mEncodeString(oTextFieldDecrypted.pTextEdit.text);
				if (oEncryptedObject.pStatus === AEnumStatus.Ok) {
					oTextFieldEncrypted.mSetText(oEncryptedObject.pValue);
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

		DMBarTextSelectedSign_splitted {

			id: oSignTextSelected;
			height: parent.height * 0.1;
			width: parent.width;
			anchors.bottom: oMenuAction.bottom;
			anchors.left: parent.left;
			anchors.right: parent.right;
		}

		function mSelectEncrypted() {

			oSignTextSelected.state = "Encrypted";
			oTextField.state = "Encrypted";
			oBarText.pButtonDecryptedText.state = "Default";
			oBarText.pButtonEncryptedText.state = "Selected";
		}

		function mSelectDecrypted() {

			oSignTextSelected.state = "Decrypted";
			oTextField.state = "Decrypted";
			oBarText.pButtonDecryptedText.state = "Selected";
			oBarText.pButtonEncryptedText.state = "Default";
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
				oRoot.state = "PasswordActiveFocus";
				oBarPasswordMenu.visible = true;
			} else {
				oRoot.state = "Default";
				oBarPasswordMenu.visible = false;
			}
		}
	}

	DMBarPasswordMenu {

		id: oBarPasswordMenu;
		width: oSignAction.width;
		anchors.bottom: oBarPassword.top;
		anchors.bottomMargin: 5;
		anchors.horizontalCenter: parent.horizontalCenter;

		pButtonPasswordFromClipboard.onClicked: {

			oBarPassword.pTextInput.text = AClipboard.mTextPasteFrom();
			oRoot.pScreen.mShowNotification(qsTrId("DM.Password.Pasted"),"Password");
			console.debug("Password copied from clipboard");
		}

		pButtonPasswordToClipboard.onClicked: {

			AClipboard.mTextCopyTo(oBarPassword.pTextInput.text);
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

		Connections {

			target: AApplication;

			function onSgDeclareAction(inAction) {

				if (oStackView.currentItem === oRoot) oSignAction.mRegenerate();
			}
		}
	}

	Connections {

		target: oMainWindow;

		function onSgKeyboardVisible(inVisibility) {

			if (inVisibility) {

			} else {
				if (oBarPassword.pTextInput.activeFocus) oBarPassword.forceActiveFocus();
			}
		}
	}
}

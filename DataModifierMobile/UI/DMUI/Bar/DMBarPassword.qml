// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/06/2026 at 15:48:33
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Window;

// Application includes
import UIDataModifierMobile;
import AEnums;


// Component
Rectangle {

	property string pTextDefault: qsTrId("DM.Password.Default");
	property string pPasswordMask: "**********";
	property real pHeight: AUIConfig.mElementHeight();
	property alias pTextInput: oPasswordInput.pTextInput;
	property alias pPassword: oPasswordInput.pTextInput.text;

	id: oRoot;
	height: AUIConfig.mElementHeight() * 1.37;
	color: AColors.mGetString("BlackLight");

	DMSignLineLeft {

		id: oSignLineLeft;
		height: oRoot.pHeight;
		anchors.left: parent.left;
		anchors.verticalCenter: parent.verticalCenter;
	}

	DMButtonPasswordVisible {

		id: oButtonVisible;
		height: oRoot.pHeight;
		width: oButtonVisible.height * 1.55;
		anchors.left: oSignLineLeft.right;
		anchors.verticalCenter: parent.verticalCenter;

		pMouseArea.onClicked: {

			if (!oPasswordInput.pTextInput.activeFocus) {
				if (oButtonVisible.pVisibility) {
					if (oPasswordInput.pTextInput.text !== oRoot.pTextDefault) {
						oPasswordInput.mPasswordGet();
					}
				} else {
					if (oPasswordInput.pTextInput.text !== oRoot.pTextDefault) {
						oPasswordInput.pTextInput.text = oRoot.pPasswordMask;
					}
				}
			}
		}
	}

	DMSeparatorVerticalWhite {

		id: oSeparatorLeft;
		height: oRoot.pHeight;
		anchors.left: oButtonVisible.right;
		anchors.verticalCenter: parent.verticalCenter;
	}

	DMTextInputPassword {

		id: oPasswordInput;
		height: oRoot.pHeight;
		anchors.left: oSeparatorLeft.right;
		anchors.right: oSeparatorRight.left;
		anchors.verticalCenter: parent.verticalCenter;
		state: oButtonVisible.pVisibility ? "Visible" : "Hidden";

		pTextInput.text: oRoot.pTextDefault;

		pTextInput.onAccepted: {

			oPasswordInput.pTextInput.focus = false;
			Qt.inputMethod.hide();
		}

		pTextInput.onActiveFocusChanged: {

			if (oPasswordInput.pTextInput.activeFocus) {
				oButtonPassword.state = "Accept";
				oButtonPassword.pAccept = true;
				if (oPasswordInput.pTextInput.text === oRoot.pTextDefault) {
					oPasswordInput.pTextInput.text = "";
					oButtonVisible.pVisibility = false;
				} else {
					oPasswordInput.mPasswordGet();
				}
			} else {
				if (oPasswordInput.pTextInput.text === "") {
					oRoot.pTextDefault = qsTrId("DM.Password.Default");
					oPasswordInput.pTextInput.text = qsTrId("DM.Password.Default");
				} else {
					var oPasswordSet = DMCore.mPasswordSet(oPasswordInput.pTextInput.text);
					if (oPasswordSet.pStatus === AEnumStatus.Ok) {
						oPasswordInput.pTextInput.text = oRoot.pPasswordMask;
						DMCore.mClearOutput(oPasswordSet);
						oPasswordSet = {};
						oButtonPassword.state = "Active";
						oButtonPassword.pAccept = false;
						console.error("Set new password");
					} else {
						oRoot.pScreen.mShowNotification(qsTrId("DM.Error.SomethingWentWrong"),"Error");
						console.error("Can't set new password");
					}
				}
			}
		}

		Component.onCompleted: {

			oButtonVisible.pVisibility = true;
		}

		Connections {

			target: Application;

			function onStateChanged(inState) {

				if (inState === Qt.ApplicationHidden || inState === Qt.ApplicationSuspended) {
					if (ASettings.mGetValue("SwitchPasswordClear")) {
						oPasswordInput.pTextInput.text = oRoot.pTextDefault;
					}
				}
			}
		}

		function mPasswordGet() {

			var oPasswordGet = DMCore.mPasswordGet();
			if (oPasswordGet.pStatus === AEnumStatus.Ok) {
				oPasswordInput.pTextInput.text = oPasswordGet.pValue;
			} else {
				oRoot.pScreen.mShowNotification(qsTrId("DM.Error.SomethingWentWrong"),"Error");
				console.error("Can't get password");
			}
			DMCore.mClearOutput(oPasswordGet);
			oPasswordGet = {};
		}
	}

	DMSeparatorVerticalWhite {

		id: oSeparatorRight;
		height: oRoot.pHeight;
		anchors.right: oButtonPassword.left;
		anchors.verticalCenter: parent.verticalCenter;
	}

	DMButtonPasswordBarMenu {

		id: oButtonPassword;
		height: oRoot.pHeight;
		width: oButtonPassword.height * 1.55;
		anchors.right: oSignLineRight.left;
		anchors.verticalCenter: parent.verticalCenter;

		pMouseArea.onClicked: {

			if (oButtonPassword.state === "Active") {

				oPasswordInput.pTextInput.forceActiveFocus();
				Qt.inputMethod.show();
				oButtonPassword.state = "Accept";
				oButtonPassword.pAccept = true;

			} else if (oButtonPassword.state === "Accept") {

				if (
					oPasswordInput.pTextInput.text === oRoot.pTextDefault ||
					oPasswordInput.pTextInput.text === ""
				) {
					oButtonVisible.pVisibility = true;
				} else {
					oButtonVisible.pVisibility = false;
				}

				oPasswordInput.pTextInput.accepted();
				Qt.inputMethod.hide();
				oButtonPassword.state = "Active";
				oButtonPassword.pAccept = false;
			}
		}

		Connections {

			target: ATranslator;

			function onSgLocaleChanged(inLocale) {

				if (oPasswordInput.pTextInput.text === oRoot.pTextDefault) {
					oRoot.pTextDefault = qsTrId("DM.Password.Default");
					oPasswordInput.pTextInput.text = qsTrId("DM.Password.Default");
				}
			}
		}
	}

	DMSignLineRight {

		id: oSignLineRight;
		height: oRoot.pHeight;
		anchors.right: parent.right;
		anchors.verticalCenter: parent.verticalCenter;
	}
}

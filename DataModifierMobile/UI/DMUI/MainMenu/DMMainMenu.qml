// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/06/2026 at 10:48:05
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

	id: oRoot;

	ScrollView {

		id: oScrollView;
		anchors.fill: parent;
		contentHeight: oColumn.implicitHeight;
		clip: true;

		Column {

			id: oColumn;
			width: parent.width;
			spacing: AUIConfig.mElementHeight() * 0.43;

			Item {

				width: parent.width;
				height: AUIConfig.mElementHeight() * 0.15;
			}

			DMMenuEncryption {

				id: oEncryption;
				pID: "Encryption";
				pLabel: qsTrId("DM.MainMenu.Encryption.label");
				pNotice: qsTrId("DM.MainMenu.Encryption.notice");
			}

			DMMenuSwitch {

				id: oSwitchEncryptToClipboard;
				pID: "SwitchEncryptToClipbard";
				pDeclareAction: true;
				pLabel: qsTrId("DM.MainMenu.EncryptAndCopy.label");
				pNotice: qsTrId("DM.MainMenu.EncryptAndCopy.notice");
			}

			DMMenuSwitch {

				id: oSwitchDecryptFromClipboard;
				pID: "SwitchDecryptFromClipbard";
				pDeclareAction: true;
				pLabel: qsTrId("DM.MainMenu.PasteAndDecrypt.label");
				pNotice: qsTrId("DM.MainMenu.PasteAndDecrypt.notice");
			}

			DMMenuSwitch {

				id: oSwitchScreenClear;
				pID: "SwitchScreenClear";
				pDeclareAction: true;
				pLabel: qsTrId("DM.MainMenu.SwitchScreenClear.label");
				pNotice: qsTrId("DM.MainMenu.SwitchScreenClear.notice");
			}

			DMMenuSwitch {

				id: oSwitchPasswordClear;
				pID: "SwitchPasswordClear";
				pDeclareAction: true;
				pLabel: qsTrId("DM.MainMenu.SwitchPasswordClear.label");
				pNotice: qsTrId("DM.MainMenu.SwitchPasswordClear.notice");
			}

			DMMenuSwitch {

				id: oSwitchClipboardClear;
				pID: "SwitchClipboardClear"
				pDeclareAction: true;
				pLabel: qsTrId("DM.MainMenu.ClipboardClear.label");
				pNotice: Qt.platform.os === "ios" ?
					qsTrId("DM.MainMenu.ClipboardClear.IOS.notice"):
					qsTrId("DM.MainMenu.ClipboardClear.Android.notice");
			}

			DMMenuSwitch {

				id: oSwitchInputTextHelpers;
				pID: "SwitchInputTextHelpers"
				pDeclareAction: true;
				pLabel: qsTrId("DM.MainMenu.SwitchInputTextHelpers.label");
				pNotice: qsTrId("DM.MainMenu.SwitchInputTextHelpers.notice");
			}

			DMMenuSwitch {

				id: oSwitchContextMenuProhibited;
				pID: "SwitchContextMenuProhibited"
				pDeclareAction: true;
				pLabel: qsTrId("DM.MainMenu.SwitchContextMenuProhibited.label");
				pNotice: qsTrId("DM.MainMenu.SwitchContextMenuProhibited.notice");
			}

			DMMenuSwitch {

				id: oSwitchScreenPrivacy;
				pID: "SwitchScreenPrivacy";
				pDeclareAction: true;
				pLabel: qsTrId("DM.MainMenu.ScreenPrivacy.label");
				pNotice: Qt.platform.os === "ios" ?
					qsTrId("DM.MainMenu.ScreenPrivacy.IOS.notice"):
					qsTrId("DM.MainMenu.ScreenPrivacy.Android.notice");

				pSwitch.onClicked: {

					APrivacy.mScreen(ASettings.mGetValue(oSwitchScreenPrivacy.pID));
				}
			}

			DMMenuLanguage {

				id: oLanguage;
				pID: "Language";
				pLabel: qsTrId("DM.MainMenu.Language.label");
				pNotice: qsTrId("DM.MainMenu.Language.notice");
			}

			DMMenuUISchema {

				id: oUISchema;
				pID: "UISchema";
				pLabel: qsTrId("DM.MainMenu.UISchema.label");
				pNotice: qsTrId("DM.MainMenu.UISchema.notice");
			}

			Item {

				width: parent.width;
				height: 10;
			}

			DMMenuAbout {

				id: oAbout;
				pLabel: qsTrId("DM.MainMenu.About.label");
			}

			DMMenuButtonQuit {

				id: oButtonQuitApplication;
				pLabel: qsTrId("DM.MainMenu.ButtonQuit.label");
				pNotice: qsTrId("DM.MainMenu.ButtonQuit.notice");
			}

			Item {

				width: parent.width;
				height: AUIConfig.mElementHeight() * 0.31;
			}
		}
	}
}

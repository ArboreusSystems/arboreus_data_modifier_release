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
				pID: "Encryption"
				pLabel: qsTrId("DM.MainMenu.Encryption.label");
				pNotice: qsTrId("DM.MainMenu.Encryption.notice");
			}

			DMMenuSwitch {

				id: oSwitchClipboardClear;
				pID: "ClipboardClear"
				pDeclareAction: true;
				pLabel: qsTrId("DM.MainMenu.ClipboardClear.label");
				pNotice: qsTrId("DM.MainMenu.ClipboardClear.notice");
			}

			DMMenuSwitch {

				id: oSwitchEncryptToClipboard;
				pID: "SwitchEncryptToClipbard"
				pDeclareAction: true;
				pLabel: qsTrId("DM.MainMenu.EncryptAndCopy.label");
				pNotice: qsTrId("DM.MainMenu.EncryptAndCopy.notice");
			}

			DMMenuSwitch {

				id: oSwitchDecryptFromClipboard;
				pID: "SwitchDecryptFromClipbard"
				pDeclareAction: true;
				pLabel: qsTrId("DM.MainMenu.PasteAndDecrypt.label");
				pNotice: qsTrId("DM.MainMenu.PasteAndDecrypt.notice");
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

// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/06/2026 at 21:42:52
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;

// Application includes
import UIDataModifierMobile;


// Component
Item {

	property alias pButtonDecryptedFromClipboard: oButtonDecryptedFromClipboard;
	property alias pButtonDecryptedToClipboard: oButtonDecryptedToClipboard;
	property alias pButtonDecrypt: oButtonDecrypt;
	property alias pButtonEncrypt: oButtonEncrypt;
	property alias pButtonEncryptedToClipboard: oButtonEncryptedToClipboard;
	property alias pButtonEncryptedFromClipboard: oButtonEncryptedFromClipboard;

	id: oRoot;
	height: parent.width * 0.33;
	width: parent.width;

	Rectangle {

		id: oLineTop;
		width: parent.width * 0.35;
		height: AUIConfig.mElementHeight() * 0.075;
		color: AColors.mGetString("DeepBlue");
		anchors.top: parent.top;
		anchors.topMargin: 7;
		anchors.left: parent.left;
	}

	DMButtonDecryptedFromClipboard_splitted {

		id: oButtonDecryptedFromClipboard;
		width: oButtonEncrypt.width * 0.815;
		anchors.top: oLineTop.bottom;
		anchors.topMargin: oLineTop.height;
		anchors.right: oButtonDecryptedToClipboard.left;
		anchors.rightMargin: AUIConfig.mElementHeight() * 0.12;
	}

	DMButtonDecryptedToClipboard_splitted {

		id: oButtonDecryptedToClipboard;
		width: oButtonEncrypt.width * 0.815;
		anchors.top: oLineTop.bottom;
		anchors.topMargin: oLineTop.height;
		anchors.right: oButtonDecrypt.left;
		anchors.rightMargin: AUIConfig.mElementHeight() * 0.12;
	}

	DMButtonDecrypt_splitted {

		id: oButtonDecrypt;
		width: parent.width * 0.13;
		anchors.top: oLineTop.bottom;
		anchors.topMargin: oLineTop.height;
		anchors.right: oButtonMainMenu.left;
		anchors.rightMargin: AUIConfig.mElementHeight() * 0.27;
	}

	DMButtonMainMenu {

		id: oButtonMainMenu;
		pID: "oButtonMainMenu";
		height: width;
		width: parent.width * 0.16;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;
	}

	DMButtonEncrypt_splitted {

		id: oButtonEncrypt;
		width: parent.width * 0.12;
		anchors.bottom: oLineBottom.top;
		anchors.bottomMargin: oLineTop.height;
		anchors.left: oButtonMainMenu.right;
		anchors.leftMargin: AUIConfig.mElementHeight() * 0.27;
	}

	DMButtonEncryptedToClipboard_splitted {

		id: oButtonEncryptedToClipboard;
		width: oButtonEncrypt.width * 0.72;
		anchors.bottom: oLineBottom.top;
		anchors.bottomMargin: oLineTop.height;
		anchors.left: oButtonEncrypt.right;
		anchors.leftMargin: AUIConfig.mElementHeight() * 0.21;
	}

	DMButtonEncryptedFromClipboard_splitted {

		id: oButtonEncryptedFromClipboard;
		width: oButtonEncrypt.width * 0.72;
		anchors.bottom: oLineBottom.top;
		anchors.bottomMargin: oLineTop.height;
		anchors.left: oButtonEncryptedToClipboard.right;
		anchors.leftMargin: AUIConfig.mElementHeight() * 0.21;
	}

	Rectangle {

		id: oLineBottom;
		width: parent.width * 0.35;
		height: AUIConfig.mElementHeight() * 0.075;
		color: AColors.mGetString("DeepBlue");
		anchors.bottom: parent.bottom;
		anchors.bottomMargin: 7;
		anchors.right: parent.right;
	}
}

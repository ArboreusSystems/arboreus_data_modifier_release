// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/08/2026 at 10:47:41
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

	property alias pButtonDecryptedText: oButtonDecryptedText;
	property alias pButtonEncryptedText: oButtonEncryptedText;

	id: oRoot;

	DMButtonTextDecrypted_splitted {

		id: oButtonDecryptedText;
		height: parent.height;
		anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.right: oBarTextCenter.left;
	}

	Rectangle {

		id: oBarTextCenter;
		width: parent.height;
		height: parent.height;
		anchors.horizontalCenter: parent.horizontalCenter;
		color: AColors.mGetString("DeepBlue");

		Rectangle {

			height: 2;
			width: parent.width * 0.44;
			color: AColors.mGetString("White");
			anchors.horizontalCenter: parent.horizontalCenter;
			anchors.bottom: parent.verticalCenter;
			anchors.bottomMargin: 1;
		}

		Rectangle {

			height: 2;
			width: parent.width * 0.44;
			color: AColors.mGetString("White");
			anchors.horizontalCenter: parent.horizontalCenter;
			anchors.top: parent.verticalCenter;
			anchors.topMargin: 1;
		}
	}

	DMButtonTextEncrypted_splitted {

		id: oButtonEncryptedText;
		height: parent.height;
		anchors.top: parent.top;
		anchors.right: parent.right;
		anchors.left: oBarTextCenter.right;
	}
}

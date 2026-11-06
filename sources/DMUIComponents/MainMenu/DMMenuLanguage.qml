// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/07/2026 at 19:43:27
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Layouts;

// Application includes
import UIDataModifierMobile;


// Component
Item {

	required property string pID;
	property string pLabel: "Label";
	property string pNotice: "Notice";

	id: oRoot;
	height: oLabel.paintedHeight + oNotice.paintedHeight + 17 + oRowLanguage.height;
	width: parent.width;

	DMSignLineLeft {

		id: oSignLineLeft;
		height: AUIConfig.mElementHeight();
		anchors.left: parent.left;
		anchors.top: parent.top;
	}

	DMTextHeader {

		id: oLabel;
		text: oRoot.pLabel;
		color: AColors.mGetString("White");
		anchors.top: parent.top;
		anchors.left: oSignLineLeft.right;
		anchors.leftMargin: oSignLineLeft.height / 2.75;
	}

	DMText {

		id: oNotice;
		text: oRoot.pNotice;
		color: AColors.mGetString("WhiteDark");
		anchors.top: oLabel.bottom;
		anchors.topMargin: oSignLineLeft.height / 5;
		anchors.left: oSignLineLeft.right;
		anchors.leftMargin: oSignLineLeft.height / 2.75;
		anchors.right: oRoot.right;
		anchors.rightMargin: oSignLineLeft.width;
	}

	RowLayout {

		id: oRowLanguage;
		height: 30;
		spacing: 0;
		anchors.top: oNotice.bottom;
		anchors.topMargin: oSignLineLeft.height / 5;
		anchors.left: oSignLineLeft.right;
		anchors.leftMargin: oSignLineLeft.height / 2.75;

		Repeater {

			model: ATranslator.mLocaleList();

			DMRadioButton {

				height: 30;
				text: modelData.toUpperCase();

				onClicked: {

					ASettings.mSetValue("Locale",modelData);
					ATranslator.mLocaleSet(ASettings.mGetValue("Locale"));
				}

				Component.onCompleted: {

					checked = ATranslator.mLocaleGet() === modelData;
				}
			}
		}
	}
}

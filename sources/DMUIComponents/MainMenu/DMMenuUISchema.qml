// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/08/2026 at 21:57:19
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
	height: oLabel.paintedHeight + oNotice.paintedHeight + 17 + oRowUISchema.height;
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

		id: oRowUISchema;
		height: 30;
		spacing: 0;
		anchors.top: oNotice.bottom;
		anchors.topMargin: oSignLineLeft.height / 5;
		anchors.left: oSignLineLeft.right;
		anchors.leftMargin: oSignLineLeft.height / 2.75;

		Repeater {

			model: [
				["All-In-One",1],
				["Splitted",0]
			];

			DMRadioButton {

				height: 30;
				text: modelData[0];

				onClicked: {

					ASettings.mSetValue("UISchema",modelData[1]);
				}

				Component.onCompleted: {

					checked = ASettings.mGetValue("UISchema") === modelData[1];
				}
			}
		}
	}
}

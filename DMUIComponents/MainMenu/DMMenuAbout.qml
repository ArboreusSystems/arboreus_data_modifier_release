// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/09/2026 at 06:41:09
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

	property string pLabel: "Label";

	id: oRoot;
	height: oLabel.paintedHeight + oNotice.paintedHeight + 13;
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
		text:
			"Arboreus Data Modifier (C) 2026<br/>
			version 1.0.0<br/>
			<a href='https://github.com/ArboreusSystems/arboreus_modifier_mobile' style='color: " +
			AColors.mGetString("WhiteDark") + ";'>Sources on Github</a>";
		textFormat: Text.RichText;
		color: AColors.mGetString("WhiteDark");
		anchors.top: oLabel.bottom;
		anchors.topMargin: oSignLineLeft.height / 5;
		anchors.left: oSignLineLeft.right;
		anchors.leftMargin: oSignLineLeft.height / 2.75;
		anchors.right: oRoot.right;
		anchors.rightMargin: oSignLineLeft.width;

		onLinkActivated: (inLink) => {

			Qt.openUrlExternally(inLink);
		}
	}
}

// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/07/2026 at 14:07:59
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

	required property string pID;
	required property string pSourceActive;
	required property string pSourceHover;

	property alias pMouseArea: oButtonCancel.pMouseArea;
	property alias pDeclareAction: oButtonCancel.pDeclareAction;

	id: oRoot;
	width: 25;
	height: 25;
	state: "Active";

	states: [

		State {

			name: "Active";

			PropertyChanges {

				target: oBackgroundImage;
				source: oRoot.pSourceActive;
			}
		},

		State {

			name: "Hover";
			PropertyChanges {

				target: oBackgroundImage;
				source: oRoot.pSourceHover;
			}
		}
	]

	Image {

		id: oBackgroundImage;
		anchors.fill: parent;
	}

	AAreaButton {

		id: oButtonCancel;
		pID: oRoot.pID;
		anchors.fill: parent;
		color: AColors.mTransparent();

		pMouseArea.onPressed: {

			oRoot.state = "Hover";
		}

		pMouseArea.onReleased: {

			oRoot.state = "Active";
		}
	}
}

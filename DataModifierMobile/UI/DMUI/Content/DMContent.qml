// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/02/2026 at 07:00:25
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes
import UIDataModifierMobile;


// Component
Rectangle {

	id: oRoot;
	anchors.top: parent.top;
	anchors.bottom: parent.bottom;
	anchors.left: parent.left;
	anchors.right: parent.right;
	color: AColors.mTransparent();

	StackView {

		id: oStackView;
		anchors.top: parent.top;
		anchors.bottom: parent.bottom;
		anchors.left: parent.left;
		anchors.right: parent.right;

		Component.onCompleted: {

			oStackView.push(oScreenMain);
		}

		pushEnter: Transition {

			NumberAnimation {

				property: "y";
				from: oStackView.height;
				to: 0;
				duration: 250;
				easing.type: Easing.InCubic;
			}

			NumberAnimation {

				properties: "opacity";
				from: 0.0;
				to: 1.0;
				duration: 250;
				easing.type: Easing.InCubic;
			}
		}

		pushExit: Transition {

			PropertyAnimation {

				property: "y";
				from: 0;
				to: -oStackView.height;
				duration: 250;
				easing.type: Easing.InCubic;
			}
		}

		popEnter: Transition {

			PropertyAnimation {

				property: "y";
				from: -oStackView.height;
				to: 0;
				duration: 250;
				easing.type: Easing.InCubic;
			}
		}

		popExit: Transition {

			PropertyAnimation {

				property: "y";
				from: 0;
				to: oStackView.height;
				duration: 250;
				easing.type: Easing.InCubic;
			}
		}

		Component {id: oScreenTest; DMScreenTest {}}
		Component {id: oScreenMain; DMScreenMain {}}
		Component {id: oScreenMenu; DMScreenMenu {}}
	}
}

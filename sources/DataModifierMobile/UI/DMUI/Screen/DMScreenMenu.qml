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
DMScreen {

	id: oRoot;
	color: AColors.mGetString("GreyDarkest");

	Rectangle {

		id: oGradientWrapper;
		anchors.fill: parent;

		gradient: Gradient {

			orientation: Gradient.Vertical;

			GradientStop {position: 0.0; color: AColors.mGetString("GreyDarkest");}
			GradientStop {position: 1.0; color: AColors.mGetString("BlackLight");}
		}
	}

	DMSignAction {

		id: oSignAction;
		anchors.top: parent.top;
		anchors.horizontalCenter: parent.horizontalCenter;

		Connections {

			target: AApplication;
			function onSgDeclareAction(inAction) {

				if (oStackView.currentItem === oRoot) oSignAction.mRegenerate();
			}
		}
	}

	DMBarMainMenu {

		id: oBarMainMenu;
		width: oSignAction.width;
		anchors.top: oSignAction.bottom;
		anchors.horizontalCenter: parent.horizontalCenter;
	}

	DMMainMenu {

		id: oMainMenu;
		width: oSignAction.width;
		anchors.top: oBarMainMenu.bottom;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.bottom: parent.bottom;
	}
}

// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/01/2026 at 08:02:15
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes
import UIDataModifierMobile;


// Component
DMWindowMobile {

	id: oMainWindow;

	pContentWrapper.data: DMContent {

		id: oContent;
		color: oMainWindow.pColorBackgroundContent;
		anchors.fill: parent;
	}

	pBackgroundWrapper.data: Item {

		id: oBackground;
		anchors.fill: parent;

		Item {

			id: oBackgroundSign;
			width: parent.width;
			height: parent.height * 0.5;
			anchors.bottom: parent.bottom;
			visible: false;

			DMSignAction {

				id: oSignAction;
				height: parent.height;
				anchors.bottom: parent.bottom;
				anchors.horizontalCenter: parent.horizontalCenter;
				visible: true;

				Connections {

					target: AApplication;

					function onSgDeclareAction(inAction) {

						if (oBackground.visible) oSignAction.mRegenerate();
					}
				}
			}

			Rectangle {

				id: oSignGradient;
				width: parent.width;
				height: oSignAction.height * 0.61;
				anchors.bottom: parent.bottom;
				anchors.horizontalCenter: parent.horizontalCenter;

				gradient: Gradient {

					orientation: Gradient.Vertical;

					GradientStop {position: 1.0; color: AColors.mGetString("Blue");}
					GradientStop {position: 0.0; color: AColors.mTransparent();}
				}
			}

			Connections {

				target: oMainWindow;

				function onSgKeyboardVisible(inVisibility) {

					if (inVisibility) {
						oBackgroundSign.visible = true;
					} else {
						oBackgroundSign.visible = false;
					}
				}
			}
		}
	}
}

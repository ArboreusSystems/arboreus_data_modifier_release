// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/07/2026 at 09:02:37
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;

// Application includes
import UIDataModifierMobile;


// Component
DMAreaButton {

	property bool pVisibility: false;

	id: oRoot;
	pID: "ButtonVisible";
	state: oRoot.pVisibility ? "Visible" : "Hidden";

	pMouseArea.onClicked: oRoot.mSetVisible();

	pMouseArea.onPressed: {

		if (oRoot.state === "Hidden") {
			oImageButtonVisible.source = "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordSignVisibleHover.svg";
		} else {
			oImageButtonVisible.source = "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordSignHiddenHover.svg";
		}
	}

	pMouseArea.onReleased: {

		if (oRoot.state === "Hidden") {
			oImageButtonVisible.source = "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordSignVisibleActive.svg";
		} else {
			oImageButtonVisible.source = "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordSignHiddenActive.svg";
		}
	}

	states: [

		State {

			name: "Hidden";

			PropertyChanges {

				target: oImageButtonVisible;
				source: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordSignVisibleActive.svg";
			}
		},

		State {

			name: "Visible";

			PropertyChanges {

				target: oImageButtonVisible;
				source: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordSignHiddenActive.svg";
			}
		}
	]

	Image {

		id: oImageButtonVisible;
		height: oRoot.height * 0.71 * sourceSize.height / sourceSize.width;
		width: oRoot.width * 0.71 * sourceSize.width / sourceSize.height;
		fillMode: Image.PreserveAspectFit;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
	}

	function mSetVisible() {

		if (oRoot.pVisibility) {
			oRoot.pVisibility = false;
		} else {
			oRoot.pVisibility = true;
		}
	}
}

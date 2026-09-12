// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/06/2026 at 13:08:45
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;

// Application includes


// Component
Item {

	id: oImageLeftWrapper;
	width: height * 0.59;

	Image {

		id: oImageLeft;
		height: parent.height;
		source: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordSignRight.svg";
		fillMode: Image.PreserveAspectFit;
		anchors.left: parent.left;
	}
}

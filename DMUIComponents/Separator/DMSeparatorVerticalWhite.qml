// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/06/2026 at 20:32:08
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;

// Application includes


// Component
Rectangle {

	id: oRoot;
	width: height * oImageSeparator.sourceSize.width / oImageSeparator.sourceSize.height;

	Image {

		id: oImageSeparator;
		source: "qrc:/Resources/Images/Separator/DM_SeparatorVerticalWhite.svg";
		fillMode: Image.PreserveAspectFit;
		anchors.fill: parent;
	}
}

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
}

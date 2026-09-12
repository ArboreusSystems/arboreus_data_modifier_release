// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/06/2026 at 14:05:13
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes
import UIDataModifierMobile;
import AQML;


// Component
ATextEditMobile {

	required property string pID;

	id: oRoot;
	objectName: oRoot.pID;
	wrapMode: TextArea.Wrap;
	font.family: AFonts.mFontFamily();
	font.pixelSize: AUIConfig.mFontSizeRegular();
	selectionColor: AColors.mGetString("Blue");
	selectedTextColor: AColors.mGetString("WhiteLight");
}
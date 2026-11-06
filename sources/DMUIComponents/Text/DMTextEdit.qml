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

	Component.onCompleted: {

		oRoot.pProhibitContextMenu = ASettings.mGetValue("SwitchContextMenuProhibited");
		oRoot.mSetInputMethods(ASettings.mGetValue("SwitchInputTextHelpers"));
	}

	Connections {

		target: ASettings;

		function onSgSetValue(inKey,inValue) {

			if (inKey === "SwitchContextMenuProhibited") {
				oRoot.pProhibitContextMenu = inValue;
			} else if (inKey === "SwitchInputTextHelpers") {
				oRoot.mSetInputMethods(inValue);
			}
		}
	}

	function mSetInputMethods(inValue) {

		if (Qt.platform.os === "ios") {
			if (inValue) {
				oRoot.inputMethodHints = Qt.ImhNone;
			} else {
				oRoot.inputMethodHints = Qt.ImhSensitiveData | Qt.ImhNoPredictiveText | Qt.ImhNoAutoUppercase;
			}
		} else if (Qt.platform.os === "android") {
			oRoot.focus = false;
			Qt.inputMethod.hide();
			Qt.callLater(function() {
				if (inValue) {
					oRoot.inputMethodHints = Qt.ImhNone;
				} else {
					oRoot.inputMethodHints = Qt.ImhSensitiveData | Qt.ImhNoPredictiveText | Qt.ImhNoAutoUppercase;
				}
			});
		}
	}
}
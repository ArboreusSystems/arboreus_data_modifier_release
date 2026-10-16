// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/07/2026 at 12:42:45
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Layouts;

// Application includes
import UIDataModifierMobile;


// Component
Rectangle {

	property string pTextRaw: "";
	property string pTextDefault: qsTrId("DM.Encrypted.Default");
	property alias pText: oFlickable.pText;
	property alias pButtonDelete: oButtonDelete;
	property alias pButtonPaste: oButtonPaste;
	property alias pButtonCopy: oButtonCopy;
	property real pPaddingLeft: 0;
	property real pPaddingRight: 0;
	property real pPaddingTop: 0;
	property real pPaddingBottom: 0;

	id: oRoot;
	anchors.fill: parent;

	gradient: Gradient {

		orientation: Gradient.Vertical;

		GradientStop {position: 0.0; color: AColors.mGetString("WhiteDark");}
		GradientStop {position: 1.0; color: AColors.mGetString("WhiteLight");}
	}

	ATextFlickable {

		id: oFlickable;
		anchors.top: parent.top;
		anchors.bottom: parent.bottom;
		anchors.left: parent.left;
		anchors.right: parent.right;
		color: AColors.mTransparent();

		pText.text: oRoot.pTextDefault;
		pText.wrapMode: Text.WrapAnywhere;
		pText.horizontalAlignment: Text.AlignRight;
		pText.verticalAlignment: Text.AlignBottom;
		pText.font.family: AFonts.mFontFamily();
		pText.font.pixelSize: AUIConfig.mFontSizeRegular() * 0.91;
		pText.leftPadding: oRoot.pPaddingLeft;
		pText.rightPadding: oRoot.pPaddingRight;
		pText.topPadding: oRoot.pPaddingTop;
		pText.bottomPadding: oRoot.pPaddingBottom;

		FontMetrics {

			id: oFontMetrics;
			font.family: AFonts.mFontFamily();
			font.pixelSize: oFlickable.pText.font.pixelSize;
		}

		Connections {

			target: ATranslator;

			function onSgLocaleChanged(inLocale) {

				if (oFlickable.pText.text === oRoot.pTextDefault) {
					oRoot.pTextDefault = qsTrId("DM.Encrypted.Default");
					oFlickable.pText.text = qsTrId("DM.Encrypted.Default");
				}
			}
		}

		Connections {

			target: Application;

			function onStateChanged(inState) {

				if (inState === Qt.ApplicationHidden || inState === Qt.ApplicationSuspended) {
					if (ASettings.mGetValue("SwitchScreenClear")) {
						oFlickable.pText.text = oRoot.pTextDefault;
					}
				}
			}
		}

		function mCreateTextView(inText) {

			var oMax = -15;
			var oMin = 0;
			var oStringWidth = oFlickable.width - oRoot.pPaddingLeft - oRoot.pPaddingRight;
			var oSize = oStringWidth / oFontMetrics.averageCharacterWidth * 0.61;

			const oChunks = [];

			var oCounter = 0;
			while (oCounter < inText.length) {
				const oLineSize = oSize - (Math.floor(Math.random() * (oMax - oMin + 1)) + oMin);
				oChunks.push(inText.slice(oCounter,oCounter + oLineSize));
				oCounter += oLineSize;
			}

			return oChunks.join("\n");
		}
	}

	Rectangle {

		id: oTextCoverBottom;
		width: parent.width;
		height: oMenuText.height * 1.8;
		anchors.bottom: parent.bottom;
		anchors.horizontalCenter: parent.horizontalCenter;

		gradient: Gradient {

			orientation: Gradient.Vertical;

			GradientStop {position: 0.6; color: AColors.mGetString("WhiteLight");}
			GradientStop {position: 0.0; color: AColors.mTransparent();}
		}
	}

	Item {

		id: oMenuText;
		width: parent.width;
		height: oRowLatoutButtons.implicitHeight;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.bottom: parent.bottom;

		RowLayout {

			anchors.fill: parent;

			RowLayout {

				id: oRowLatoutButtons;
				spacing: 15;
				Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter;

				DMButtonTextMenu {

					id: oButtonDelete;
					pID: "ButtonDelete";
					pType: "Encrypted";
					pImageSourceActive: "qrc:/Resources/Images/Button/TextEdit/DM_ButtonTextEditDelete_blue.svg";
					pImageSourceHover: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordHover.svg";
				}

				DMButtonTextMenu {

					id: oButtonPaste;
					pID: "ButtonPaste";
					pType: "Encrypted";
					pImageSourceActive: "qrc:/Resources/Images/Button/TextEdit/DM_ButtonTextEditPaste_blue.svg";
					pImageSourceHover: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordHover.svg";
				}

				DMButtonTextMenu {

					id: oButtonCopy;
					pID: "ButtonCopy";
					pType: "Encrypted";
					pImageSourceActive: "qrc:/Resources/Images/Button/TextEdit/DM_ButtonTextEditCopy_blue.svg";
					pImageSourceHover: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordHover.svg";
				}
			}
		}
	}

	function mSetText(inText) {

		oRoot.pTextRaw = inText;
		oFlickable.pText.text = oFlickable.mCreateTextView(oRoot.pTextRaw);
	}
}

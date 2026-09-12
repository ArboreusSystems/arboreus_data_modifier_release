// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/07/2026 at 12:39:59
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Layouts;

// Application includes
import UIDataModifierMobile;
import AQML;


// Component
Rectangle {

	property string pTextDefault: qsTrId("DM.Decrypted.Default");
	property alias pTextEdit: oTextEdit;
	property alias pButtonDelete: oButtonDelete;
	property alias pButtonPaste: oButtonPaste;
	property alias pButtonWrite: oButtonWrite;
	property alias pButtonCopy: oButtonCopy;
	property alias pButtonOk: oButtonOk;
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

	Item {

		id: oTextEditWrapper;
		width: parent.width;
		height: parent.height;
		anchors.top: parent.top;
		anchors.bottom: parent.bottom;
		anchors.left: parent.left;
		anchors.right: parent.right;

		Flickable {

			id: oFlickable;
			anchors.fill: parent;
			clip: true;
			contentWidth: width;
			contentHeight: oTextEditLayout.height;

			Column {

				id: oTextEditLayout;
				width: oFlickable.width;
				height: Math.max(oFlickable.height, oTextEditTopSpace.height + oTextEdit.implicitHeight)

				Item {

					id: oTextEditTopSpace;
					width: parent.width;
					height: Math.max(0, oFlickable.height - oTextEdit.implicitHeight)

					MouseArea {

						anchors.fill: parent;
						onClicked: {

							oTextEdit.forceActiveFocus();
							Qt.inputMethod.show();
						}
					}
				}

				DMTextEdit {

					id: oTextEdit;
					width: parent.width;
					pID: "TextDecrypted";
					leftPadding: oRoot.pPaddingLeft;
					rightPadding: oRoot.pPaddingRight;
					bottomPadding: oRoot.pPaddingBottom;
					topPadding: oRoot.pPaddingTop;
					text: oRoot.pTextDefault;
					wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere;
					focus: true;
					cursorVisible: false;

					cursorDelegate: Component {

						Rectangle {

							width: 3;
							color: AColors.mGetString("RedWineDark");
							visible: oTextEdit.focus && oTextEdit.cursorVisible;

							SequentialAnimation on opacity {

								loops: Animation.Infinite;
								running: oTextEdit.focus;

								NumberAnimation {

									to: 1.0;
									duration: 357;
								}

								NumberAnimation {

									to: 0.0;
									duration: 357;
								}
							}
						}
					}

					onCursorRectangleChanged: oFlickable.mEnsureVisible(cursorRectangle);

					onActiveFocusChanged: {

						if (oTextEdit.activeFocus) {
							if (oTextEdit.text === oRoot.pTextDefault) {
								oTextEdit.text = "";
							}
						} else {
							if (oTextEdit.text === "") {
								oTextEdit.text = oRoot.pTextDefault;
							}
						}
					}

					onImplicitHeightChanged: {

						if (oTextEditLayout.height > oFlickable.height) {
							oFlickable.contentY = oTextEditLayout.height - oFlickable.height + oRoot.pPaddingBottom
						}
					}

					Connections {

						target: ATranslator;

						function onSgLocaleChanged(inLocale) {

							if (oTextEdit.text === oRoot.pTextDefault) {
								oRoot.pTextDefault = qsTrId("DM.Decrypted.Default");
								oTextEdit.text = qsTrId("DM.Decrypted.Default");
							}
						}
					}
				}
			}

			function mEnsureVisible(inRectangle) {

				let actualCursorY = oTextEdit.mapToItem(oTextEditLayout,inRectangle.x,inRectangle.y).y;
				if (oFlickable.contentY >= actualCursorY - oRoot.pPaddingBottom) {
					oFlickable.contentY = actualCursorY + oRoot.pPaddingBottom;
				} else if (oFlickable.contentY + oFlickable.height <= actualCursorY + inRectangle.height) {
					oFlickable.contentY = actualCursorY + inRectangle.height - oFlickable.height;
				}
			}
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
					pImageSourceActive: "qrc:/Resources/Images/Button/TextEdit/DM_ButtonTextEditDelete.svg";
					pImageSourceHover: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordHover.svg";
				}

				DMButtonTextMenu {

					id: oButtonPaste;
					pID: "ButtonPaste";
					pImageSourceActive: "qrc:/Resources/Images/Button/TextEdit/DM_ButtonTextEditPaste.svg";
					pImageSourceHover: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordHover.svg";
				}

				DMButtonTextMenu {

					id: oButtonWrite;
					pID: "ButtonWrite";
					pImageSourceActive: "qrc:/Resources/Images/Button/TextEdit/DM_ButtonTextEditWrite.svg";
					pImageSourceHover: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordHover.svg";
				}

				DMButtonTextMenu {

					id: oButtonCopy;
					pID: "ButtonCopy";
					pImageSourceActive: "qrc:/Resources/Images/Button/TextEdit/DM_ButtonTextEditCopy.svg";
					pImageSourceHover: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordHover.svg";
				}

				DMButtonTextMenu {

					id: oButtonOk;
					pID: "ButtonOk";
					pImageSourceActive: "qrc:/Resources/Images/Button/TextEdit/DM_ButtonTextEditOk.svg";
					pImageSourceHover: "qrc:/Resources/Images/Button/Password/DM_ButtonPasswordHover.svg";
				}
			}
		}
	}
}
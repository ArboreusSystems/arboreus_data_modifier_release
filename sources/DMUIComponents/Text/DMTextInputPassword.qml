// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/05/2026 at 11:53:19
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
ATextInputMobilePasswordWrapped {

	id: oRoot;
	color: AColors.mTransparent();
	state: "Hidden";

	pTextInput.verticalAlignment: Text.AlignVCenter;
	pTextInput.passwordCharacter: "\u25A0";
	pTextInput.padding: oRoot.height * 0.33;
	pTextInput.font.family: AFonts.mFontFamily();
	pTextInput.font.pixelSize: AUIConfig.mFontSizeTextInput() * 0.67;
	pTextInput.cursorDelegate: Component {

		Rectangle {

			property real pHeight: oRoot.height * 0.61;

			width: 3;
			height: pHeight;
			anchors.verticalCenter: parent.verticalCenter;
			color: AColors.mGetString("RedWineLight");
			visible: oRoot.pTextInput.cursorVisible;
			onHeightChanged: height = pHeight;

			SequentialAnimation on opacity {

				loops: Animation.Infinite;
				running: oRoot.pTextInput.focus;

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

	states: [

		State {

			name: "Visible";

			PropertyChanges {

				target: oRoot;
				pTextInput.echoMode: TextInput.Normal;
				pTextInput.font.pixelSize: AUIConfig.mFontSizeTextInput() * 1.1
			}
		},

		State {

			name: "Hidden";

			PropertyChanges {

				target: oRoot;
				pTextInput.echoMode: TextInput.Password;
				pTextInput.font.pixelSize: AUIConfig.mFontSizeTextInput() * 0.67;
			}
		}
	]
}

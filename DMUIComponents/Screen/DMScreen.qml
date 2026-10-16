// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/07/2026 at 18:22:37
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes
import UIDataModifierMobile;


// Component
AScreen {

	property int pTimeShowing: 3000;
	property int pTimeNotificationAppearing: 200;
	property int pTimeNotificationDisapearing: 500;

	id: oRoot

	Rectangle {

		id: oNotificationWrapper;
		width: parent.width;
		height: oNotification.contentHeight * 1.13;
		anchors.top: parent.top;
		// anchors.topMargin: oRoot.height * 0.1;
		anchors.horizontalCenter: parent.horizontalCenter;
		visible: false;
		opacity: 0.0;
		z: 100;
		state: "Regular";

		states: [

			State {

				name: "Regular";

				PropertyChanges {

					target: oNotificationWrapper;
					color: AColors.mGetString("DeepBlue");
				}

				PropertyChanges {

					target: oNotification;
					color: AColors.mGetString("White");
				}
			},

			State {

				name: "Error";

				PropertyChanges {

					target: oNotificationWrapper;
					color: AColors.mGetString("RedWine");
				}

				PropertyChanges {

					target: oNotification;
					color: AColors.mGetString("WhiteLight");
				}
			},

			State {

				name: "Password";

				PropertyChanges {

					target: oNotificationWrapper;
					color: AColors.mGetString("White");
				}

				PropertyChanges {

					target: oNotification;
					color: AColors.mGetString("BlackLight");
				}
			}
		]

		DMText {

			id: oNotification;
			width: oNotificationWrapper.width * 0.8;
			font.pixelSize: AUIConfig.mFontSizeRegular() * 0.75;
			color: AColors.mGetString("WhiteLight");
			horizontalAlignment: Text.AlignHCenter;
			verticalAlignment: Text.AlignVCenter;
			anchors.horizontalCenter: parent.horizontalCenter;
			anchors.verticalCenter: parent.verticalCenter;
		}

		NumberAnimation {

			id: oAnimationAppearing;
			target: oNotificationWrapper;
			property: "opacity";
			to: 1.0;
			duration: oRoot.pTimeNotificationAppearing;
			onStopped: oTimerDisappearing.start();
		}

		Timer {

			id: oTimerDisappearing;
			interval: oRoot.pTimeShowing;
			running: false;
			repeat: false;
			onTriggered: oAnimationDisappearing.start();
		}

		NumberAnimation {

			id: oAnimationDisappearing;
			target: oNotificationWrapper;
			property: "opacity";
			to: 0.0;
			duration: oRoot.pTimeNotificationDisapearing;
		}
	}

	Connections {

		target: APrivacy;

		function onSgScreenshotTaken() {

			oRoot.mShowNotification(qsTrId("DM.Error.ScreenshotTaken"),"Error");
		}

		function onSgScreenRecordingChanged(inCaptured) {

			if (inCaptured) {
				oRoot.mShowNotification(qsTrId("DM.Error.ScreenRecordingStarted"),"Error");
			} else {
				oRoot.mShowNotification(qsTrId("DM.Error.ScreenRecordingStopped"),"Regular");
			}
		}
	}

	function mShowNotification(inMessage,inState) {

		if (oAnimationAppearing.running) oAnimationAppearing.stop();
		if (oTimerDisappearing.running) oTimerDisappearing.stop();
		if (oAnimationDisappearing.running) oAnimationDisappearing.stop();

		oNotification.text = inMessage;

		oNotificationWrapper.opacity = 0.0;
		oNotificationWrapper.state = inState;
		oNotificationWrapper.visible = true;

		oAnimationAppearing.start();
	}

	function mHideNotification() {

		if (oAnimationAppearing.running) oAnimationAppearing.stop();
		if (oTimerDisappearing.running) oTimerDisappearing.stop();
		if (oAnimationDisappearing.running) oAnimationDisappearing.stop();

		oNotificationWrapper.visible = false;
		oNotificationWrapper.opacity = 0.0;
	}
}

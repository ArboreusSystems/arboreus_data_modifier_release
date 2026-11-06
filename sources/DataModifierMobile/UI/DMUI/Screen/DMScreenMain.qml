// ----------------------------------------------------------
/*!
    \qmltype
    \brief

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 11/03/2026 at 10:28:05
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
DMScreen {

	property QtObject pObjectUISchema;

	id: oRoot;

	Component.onCompleted: {

		oRoot.mSetUISchema(ASettings.mGetValue("UISchema"));
	}

	Connections {

		target: ASettings;

		function onSgSetValue(inKey,inValue) {

			if (inKey === "UISchema") oRoot.mSetUISchema(inValue);
		}
	}

	function mSetUISchema(inUISchema) {

		if (oRoot.pObjectUISchema !== null) {
			oRoot.pObjectUISchema.destroy();
			oRoot.pObjectUISchema = null;
		}

		var oUISchemaQML = "";
		if (inUISchema === 1) {
			oUISchemaQML = "DMScreenMainAllInOne.qml";
		} else {
			oUISchemaQML = "DMScreenMainSplited.qml";
		}

		let oComponent = Qt.createComponent(oUISchemaQML);
		if (oComponent.status === Component.Ready) {

			oRoot.pObjectUISchema = oComponent.createObject(oRoot,{"pScreen": oRoot});
			if (oRoot.pObjectUISchema === null) {
				console.error("Error creating the object instance");
			}

		} else if (oComponent.status === Component.Error) {
			console.error("Error loading component:",oComponent.errorString());
		}
	}
}

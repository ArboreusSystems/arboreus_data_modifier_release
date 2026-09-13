// ----------------------------------------------------------
/*!
	\class DMSettingsDriver
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 05/04/2026 at 15:53:07
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "dmsettingsdriver.h"

// Namespace
using namespace ARB;
using namespace DM;


// -----------
/*!
	\fn

	Doc.
*/

DMSettingsDriver::DMSettingsDriver(QObject* parent) : QObject(parent) {

	_A_DEBUG << "DMSettingsDriver created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMSettingsDriver::DMSettingsDriver(QString inPath, QObject* parent) {

	mEnsureDir(inPath);
	mLoadSettings(inPath);

	_A_DEBUG << "DMSettingsDriver created with path";
}


// -----------
/*!
	\fn

	Doc.
*/

DMSettingsDriver::~DMSettingsDriver(void) {

	_A_DEBUG << "DMSettingsDriver deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QVariant DMSettingsDriver::mGetValue(QString inKey) {

	return pSettings.value(inKey);
}


// -----------
/*!
	\fn

	Doc.
*/

void DMSettingsDriver::mSetValue(QString inKey, QVariant inValue) {

	pSettings.insert(inKey,inValue);
	_A_DEBUG << "Added setting key" << inKey << "with value" << inValue;

	mWriteSettings();
}


// -----------
/*!
	\fn

	Doc.
*/

void DMSettingsDriver::mEnsureDir(QString inPath) {

	QString oPath = inPath + "/" + pSubFolder;
	if (ADir::mEnsure(oPath)) {
		_A_DEBUG << "Ensured path:" << oPath;
	} else {
		_A_CRITICAL << "Path to ensure" << oPath;
		_A_FATAL("Can't ensure path");
	}
}


// -----------
/*!
	\fn

	Doc.
*/

void DMSettingsDriver::mLoadSettings(QString inPath) {

	pPath = inPath + "/" + pSubFolder + "/settings.json";

	if (AFile::mExist(pPath)) {

		AJsonFileReply oJsonReply = AJson::mFromFile(pPath);
		if (oJsonReply.Status == _A_ENUM_STATUS::Ok) {
			pSettings = oJsonReply.Json.toVariantMap();
			_A_DEBUG << "Loaded settings from JSON:" << pPath;
		} else {
			_A_CRITICAL << "Can't load settings from JSON:" << pPath;
			_A_FATAL("No loaded settings");
		}

	} else {
		pSettings = mDefaultSettings();
		_A_DEBUG << "Settings initiated with default values";
		mWriteSettings();
	}
}


// -----------
/*!
	\fn

	Doc.
*/

void DMSettingsDriver::mWriteSettings(void) {

	if (AJson::mToFileFromMap(pPath,pSettings)) {
		_A_DEBUG << "Settings written to JSON:" << pPath;
	} else {
		_A_CRITICAL << "Can't write settings to JSON:" << pPath;
		_A_FATAL("No written settings");
	}
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap DMSettingsDriver::mDefaultSettings(void) {

	QVariantMap oOutput = {
		{"UISchema",1},
		{"SwitchEncryptToClipbard",false},
		{"SwitchDecryptFromClipbard",false},
		{"Locale","en"},
		{"ClipboardClear",false},
		{"ClipboardClearTimeout",30},
	};

	return oOutput;
}

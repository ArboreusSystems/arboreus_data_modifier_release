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

void DMSettingsDriver::mDeleteByKey(QString inKey) {

	pSettings.remove(inKey);
	_A_DEBUG << "Deleted by key" << inKey;

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
			mSynchronize();
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
		{"SwitchScreenPrivacy",true},
		{"SwitchScreenClear",false},
		{"SwitchPasswordClear",false},
		{"SwitchClipboardClear",true},
		{"SwitchClipboardClearTimeout",30},
		{"SwitchInputTextHelpers",false},
		{"SwitchContextMenuProhibited",true},
		{"Locale","en"}
	};

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

void DMSettingsDriver::mSynchronize(void) {

	QVariantMap oOutput = {};
	QString oUndefined = "UndefinedSettings";
	QVariantMap oDefault = mDefaultSettings();
	bool oWrite = false;

	for (auto i = oDefault.cbegin(), end = oDefault.cend(); i != end; ++i) {
		QVariant oValue = pSettings.value(i.key(),oUndefined);
		if (oValue == QVariant(oUndefined)) {
			oOutput.insert(i.key(),i.value());
		} else {
			oOutput.insert(i.key(),oValue);
		}
	}

	pSettings = oOutput;
	mWriteSettings();
}

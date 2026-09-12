// ----------------------------------------------------------
/*!
	\headerfile DMSettingsDriver
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 05/04/2026 at 15:53:07
	\endlist
*/
// ----------------------------------------------------------
#ifndef DMSETTINGSDRIVER_H
#define DMSETTINGSDRIVER_H

// Precompiled includes
#include <dmmobile_pch.h>

// System includes

// Application includes
#include <alogger.h>
#include <asettingsdriver.h>
#include <adir.h>
#include <afile.h>
#include <ajson.h>

// Constants and definitions

// Namesapces
namespace ARB {
namespace DM {

// Class definitions
class DMSettingsDriver :
	public QObject,
	public ASettingsDriver {

	Q_OBJECT
	Q_INTERFACES(
		ARB::ASettingsDriver
	)

	public:

		explicit DMSettingsDriver(QObject* parent = nullptr);
		explicit DMSettingsDriver(QString inPath,QObject* parent = nullptr);
		virtual ~DMSettingsDriver(void);

		QVariant mGetValue(QString inKey);
		void mSetValue(QString inKey,QVariant inValue);

	private:

		QVariantMap pSettings = {};
		QString pPath = "NoDefinedPath";
		QString pSubFolder = "Settings";

		void mEnsureDir(QString inPath);
		void mLoadSettings(QString inPath);
		void mWriteSettings(void);
		QVariantMap mDefaultSettings(void);
};

} // namespace DM
} // namespace ARB

#endif // DMSETTINGSDRIVER_H

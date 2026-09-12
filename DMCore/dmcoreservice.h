// ----------------------------------------------------------
/*!
	\headerfile AModifierService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/11/2025 at 18:15:45
	\endlist
*/
// ----------------------------------------------------------
#ifndef DMCORESERVICE_H
#define DMCORESERVICE_H

// Precompiled includes
#include <dmcore_pch.h>

// System includes

// Application includes
#include <alogger.h>
#include <athreadservicetemplate.h>
#include <dmcoredriverinterface.h>
#include <Drivers/OpenSSL/dmcoressldriver.h>

// Constants and definitions

// Namesapces
namespace ARB {

// Class definitions
class DMCoreService : public AThreadServiceTemplate {

	Q_OBJECT

	public:

		DMCoreDriverInterface* pDriver = nullptr;

		explicit DMCoreService(QObject* parent = nullptr);
		virtual ~DMCoreService(void);

		QByteArray mKeyBytes(void);
		QByteArray mVectorBytes(void);
		bool mIsPasswordDefined(void);
		bool mPasswordSet(const QString& inPassword);
		QString mPasswordGet(void);
		void mPasswordDelete(void);
		void mMemoryClear(void);

	public slots:

		void slInit(void);

	signals:

		void sgInit(void);
		void sgInitiated(void);

	private:

		// TODO: Move this values to config

		static constexpr size_t __KEY_SIZE = 32;
		static constexpr size_t __IV_SIZE = 12;
		static constexpr size_t __TAG_SIZE = 16;
		static constexpr int __PBKDF2_ITERATIONS = 600000;

		QByteArray pPassword = {};
		QByteArray pKey = {};

		void mLockBuffer(void* inPointer, size_t inSize);
		void mUnlockAndClear(void* inPointer, size_t inSize);
};

} // namespace ARB

#endif // DMCORESERVICE_H

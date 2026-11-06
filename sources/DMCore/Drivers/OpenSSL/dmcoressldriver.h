// ----------------------------------------------------------
/*!
	\headerfile AOpenSSLDriver
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/10/2025 at 23:14:53
	\endlist
*/
// ----------------------------------------------------------
#ifndef DMCORESSLDRIVER_H
#define DMCORESSLDRIVER_H

// Precompiled includes
#include <dmcore_pch.h>

// System includes

// Application includes
#include <alogger.h>
#include <aopenssl.h>
#include <aoutputqvariant.h>
#include <dmcoredriverinterface.h>

// Namesapces
namespace ARB {

// Constants and definitions

// Class definitions
class DMCoreSSLDriver :
	public QObject,
	public DMCoreDriverInterface
{

	Q_OBJECT
	Q_INTERFACES(
		ARB::DMCoreDriverInterface
	)

	public:

		explicit DMCoreSSLDriver(QObject* parent = nullptr);
		virtual ~DMCoreSSLDriver(void);

		AOutputQByteArray mEncode(
			const QByteArray& inBytes, const QByteArray& inKey, const QByteArray& inVector
		);
		AOutputQByteArray mDecode(
			const QByteArray& inBytes, const QByteArray& inKey, const QByteArray& inVector
		);

	private:

		AOpenSSL* pOpenSSL = nullptr;
};

} // namespace ARB

#endif // DMCORESSLDRIVER_H

// ----------------------------------------------------------
/*!
	\class AOpenSSLDriver
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/10/2025 at 23:14:53
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "dmcoressldriver.h"

// Namespace
using namespace ARB;


// -----------
/*!
	\fn

	Doc.
*/

DMCoreSSLDriver::DMCoreSSLDriver(QObject* parent) : QObject(parent) {

	pOpenSSL = new AOpenSSL(this);

	_A_DEBUG << "AOpenSSLDriver created";
}


// -----------
/*!
	\fn

	Doc.
*/

DMCoreSSLDriver::~DMCoreSSLDriver(void) {

	_A_DEBUG << "AOpenSSLDriver deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

AOutputQByteArray DMCoreSSLDriver::mEncode(
	const QByteArray& inBytes, const QByteArray& inKey, const QByteArray& inVector
) {

	return pOpenSSL->mEncodeAES256CBC(inBytes,inKey,inVector);
}


// -----------
/*!
	\fn

	Doc.
*/

AOutputQByteArray DMCoreSSLDriver::mDecode(
	const QByteArray& inBytes, const QByteArray& inKey, const QByteArray& inVector
) {

	return pOpenSSL->mDecodeAES256CBC(inBytes,inKey,inVector);
}


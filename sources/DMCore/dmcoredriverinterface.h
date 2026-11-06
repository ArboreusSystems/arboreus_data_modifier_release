// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/10/2025 at 23:04:27
	\endlist
*/
// ----------------------------------------------------------

#ifndef DMCOREDRIVERINTERFACE_H
#define DMCOREDRIVERINTERFACE_H

// Precompiled includes
#include <dmcore_pch.h>

// System includes

// Application includes
#include <aoutputqbytearray.h>

// Constants and defintions

// Namespace
namespace ARB {

// Interface
class DMCoreDriverInterface {

	public:

		virtual AOutputQByteArray mEncode(
			const QByteArray& inBytes, const QByteArray& inKey, const QByteArray& inVector
		) = 0;
		virtual AOutputQByteArray mDecode(
			const QByteArray& inBytes, const QByteArray& inKey, const QByteArray& inVector
		) = 0;
};

} // namespace ARB

Q_DECLARE_INTERFACE(ARB::DMCoreDriverInterface,"Arboreus.DMCoreDriverInterface/1.0")

#endif // DMCOREDRIVERINTERFACE_H

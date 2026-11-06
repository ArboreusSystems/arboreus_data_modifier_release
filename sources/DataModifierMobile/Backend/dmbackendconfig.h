// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/10/2025 at 13:50:11
	\endlist
*/
// ----------------------------------------------------------

#ifndef ABACKENDCONFIG_H
#define ABACKENDCONFIG_H

// Precompiled includes
#include <dmmobile_pch.h>

// System includes

// Application includes

// Constants and defintions

// Namespace
namespace ARB {
namespace DM {

class DMBackendConfig {

	public:

		virtual const char* ABackendConfig_NameApplicationComponent(void) = 0;
};

} // namespace DM
} // namespace ARB

Q_DECLARE_INTERFACE(ARB::DM::DMBackendConfig,"ARB::DM::DMBackendConfig/1.0")

#endif // ABACKENDCONFIG_H

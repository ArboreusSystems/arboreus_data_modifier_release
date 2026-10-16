cmake_minimum_required(VERSION 3.16)


## ----------------------------------------
## Global settings

set(A_NAME_TARGET DMCore)
set(A_PREFIX A_${A_NAME_TARGET})


## ----------------------------------------
## Project settings

project(${A_NAME_TARGET} LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)


## ----------------------------------------
## Library variables

set(${A_PREFIX}_DIR_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

set(${A_PREFIX}_SOURCES)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE)
set(${A_PREFIX}_SOURCES_HEADERS)
set(${A_PREFIX}_SOURCES_CPP)
set(${A_PREFIX}_SOURCES_RESOURCES)

set(${A_PREFIX}_INCLUDE_DIR_PUBLIC)
set(${A_PREFIX}_INCLUDE_DIR_PRIVATE)


## ----------------------------------------
## Library sources

set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	dmcore_pch.h
)

set(${A_PREFIX}_SOURCES_HEADERS
	${${A_PREFIX}_SOURCES_HEADERS}
	dmcore.h
	dmcoreservice.h
	dmcore_private.h
	dmcoredriverinterface.h
	dmcoredefinitions.h
	Drivers/OpenSSL/dmcoressldriver.h
	Agents/dmcoreagentencodestring.h
	Agents/dmcoreagentdecodestring.h
	Agents/dmcoreagentpasswordset.h
	Agents/dmcoreagentpasswordget.h
	Agents/dmcoreagentispassworddefined.h
	Agents/dmcoreagentpassworddelete.h
)

set(${A_PREFIX}_SOURCES_CPP
	${${A_PREFIX}_SOURCES_CPP}
	dmcore.cpp
	dmcoreservice.cpp
	Drivers/OpenSSL/dmcoressldriver.cpp
	Agents/dmcoreagentencodestring.cpp
	Agents/dmcoreagentdecodestring.cpp
	Agents/dmcoreagentpasswordset.cpp
	Agents/dmcoreagentpasswordget.cpp
	Agents/dmcoreagentispassworddefined.cpp
	Agents/dmcoreagentpassworddelete.cpp
)

set(${A_PREFIX}_SOURCES
	${${A_PREFIX}_SOURCES}
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${${A_PREFIX}_SOURCES_HEADERS}
	${${A_PREFIX}_SOURCES_CPP}
	${${A_PREFIX}_SOURCES_RESOURCES}
)

set(${A_PREFIX}_INCLUDE_DIR_PUBLIC
	${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
	${${A_PREFIX}_DIR_ROOT}
	${${A_PREFIX}_DIR_ROOT}/Drivers
	${${A_PREFIX}_DIR_ROOT}/Drivers/OpenSSL
	${${A_PREFIX}_DIR_ROOT}/Agents
)


## ----------------------------------------
## Platforms settings

if(APPLE)

endif()

if(IOS)

endif()

if(ANDROID)

	set(QT_FORCE_CMP0156_TO_VALUE NEW)

endif()


## ----------------------------------------
## Qt settings

find_package(Qt6 REQUIRED COMPONENTS Core Qml)

qt_standard_project_setup(REQUIRES 6.8)
qt_add_library(${A_NAME_TARGET} STATIC ${${A_PREFIX}_SOURCES})

target_link_libraries(${A_NAME_TARGET}
	PRIVATE
		Qt6::Core
		Qt6::Qml
		ALogger
		ATemplates
		AOpenSSL
)

target_compile_definitions(${A_NAME_TARGET}
	PRIVATE
		AMODIFIER_LIBRARY
)

target_include_directories(${A_NAME_TARGET}
	PUBLIC
		${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
		$<TARGET_PROPERTY:ATemplates,INTERFACE_INCLUDE_DIRECTORIES>
		$<TARGET_PROPERTY:AOpenSSL,INTERFACE_INCLUDE_DIRECTORIES>
	PRIVATE
		${${A_PREFIX}_INCLUDE_DIR_PRIVATE}
)


## ----------------------------------------
## Precompiled headers settings

if(
	NOT ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE} EQUAL "" OR
	NOT ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC} EQUAL ""
)
	if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_OPTION_USING_PCH)
		message(STATUS "Using PCH for ${A_NAME_TARGET}")
		target_precompile_headers(${A_NAME_TARGET}
			PRIVATE ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
			PUBLIC ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
		)
		set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
	else()
		message(STATUS "No PCH for ${A_NAME_TARGET}")
	endif()
endif()

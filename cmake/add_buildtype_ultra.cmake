cmake_minimum_required(VERSION 3.0)

IF(CMAKE_BUILD_TYPE MATCHES "^ultra$")
	include(setup-lto)
ENDIF()

SET(CMAKE_CXX_FLAGS_ULTRA
	"-DNDEBUG -g -O3 -march=native -flto -fno-fat-lto-objects -frounding-math"
	CACHE STRING "Flags used by the C++ compiler during ultra builds."
	FORCE
)

SET(CMAKE_C_FLAGS_ULTRA
	"-DNDEBUG -g -O3 -march=native -flto -fno-fat-lto-objects -frounding-math"
	CACHE STRING "Flags used by the C compiler during ultra builds."
	FORCE
)

SET(CMAKE_EXE_LINKER_FLAGS_ULTRA
	""
	CACHE STRING "Flags used for linking binaries during ultra builds."
	FORCE
)
SET(CMAKE_SHARED_LINKER_FLAGS_ULTRA
	""
	CACHE STRING "Flags used by the shared libraries linker during ultra builds."
	FORCE
)

SET(LIBOSCAR_NO_DATA_REFCOUNTING_ENABLED
	"True"
	CACHE STRING "Disable data refcounting in liboscar"
	FORCE
)

SET(SSERIALIZE_CONTIGUOUS_UBA_ONLY_SOFT_FAIL_ENABLED
	"True"
	CACHE STRING "Disable non-contiguous UBA"
	FORCE
)

MARK_AS_ADVANCED(
	CMAKE_CXX_FLAGS_ULTRA
	CMAKE_C_FLAGS_ULTRA
	CMAKE_EXE_LINKER_FLAGS_ULTRA
	CMAKE_SHARED_LINKER_FLAGS_ULTRA
)

set(CMAKE_CONFIGURATION_TYPES  
	"${CMAKE_CONFIGURATION_TYPES} ultra"
)

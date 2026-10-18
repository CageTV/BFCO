# BFCO.dll (the "ng" source behind BFCO NG) on alandtse's CommonLibSSE-NG (Skyrim 1.6.1170 and 1.7.x, SE and AE);
# included by E:/WorkSpace/ng-build/CMakeLists.txt (see ng_plugin there). The repository's own CMakeLists.txt is the older build
# (doodlum / CharmedBaryon CommonLibVR through $ENV{COMMONLIB_SSE_FOLDER}) for Skyrim VR and 1.6.1130 and older.
# Needs the overlay ports in cmake/ports (clib-util, clib-utils-qtr, skse-mcp): ng-build/CMakePresets.json points VCPKG_OVERLAY_PORTS here.
file(GLOB _bfco_ng_sources RELATIVE "${CMAKE_CURRENT_LIST_DIR}" CONFIGURE_DEPENDS "${CMAKE_CURRENT_LIST_DIR}/src/*.cpp")
find_package(RapidJSON CONFIG QUIET)
find_path(BFCO_CLIB_UTIL_INCLUDE_DIRS "ClibUtil/utils.hpp")
find_path(BFCO_CLIB_UTILS_QTR_INCLUDE_DIRS "ClibUtilsQTR/utils.hpp")
find_path(BFCO_SKSE_MCP_INCLUDE_DIRS "SKSEMCP/utils.hpp")
find_path(BFCO_RAPIDJSON_INCLUDE_DIRS "rapidjson/document.h")
ng_plugin(TARGET BFCO_ng NAME BFCO VERSION 0.1.0.0 AUTHOR "viny" ROOT "${CMAKE_CURRENT_LIST_DIR}"
    SOURCES ${_bfco_ng_sources}
    INCLUDES "${CMAKE_CURRENT_LIST_DIR}/include" "${BFCO_CLIB_UTIL_INCLUDE_DIRS}" "${BFCO_CLIB_UTILS_QTR_INCLUDE_DIRS}" "${BFCO_SKSE_MCP_INCLUDE_DIRS}" "${BFCO_RAPIDJSON_INCLUDE_DIRS}"
    PCH "${CMAKE_CURRENT_LIST_DIR}/include/PCH.h"
    DEFINES IS_HOST_PLUGIN)

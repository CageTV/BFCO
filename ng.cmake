# BFCO.dll (the "og" source behind BFCO - Attack Behavior Framework) on alandtse's CommonLibSSE-NG (Skyrim 1.6.1170 and 1.7.x, SE and AE);
# included by E:/WorkSpace/ng-build/CMakeLists.txt (see ng_plugin there). The repository's own CMakeLists.txt is the older build
# (doodlum / CharmedBaryon CommonLibVR through $ENV{COMMONLIB_SSE_FOLDER}) for Skyrim VR and 1.6.1130 and older.
file(GLOB _bfco_og_sources RELATIVE "${CMAKE_CURRENT_LIST_DIR}" CONFIGURE_DEPENDS "${CMAKE_CURRENT_LIST_DIR}/src/*.cpp")
ng_plugin(TARGET BFCO_og NAME BFCO VERSION 0.17.0.10 AUTHOR "viny" ROOT "${CMAKE_CURRENT_LIST_DIR}"
    SOURCES ${_bfco_og_sources}
    INCLUDES "${CMAKE_CURRENT_LIST_DIR}/include"
    PCH "${CMAKE_CURRENT_LIST_DIR}/include/PCH.h"
    DEFINES IS_HOST_PLUGIN)

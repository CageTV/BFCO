#### YOU NEED CMAKE < 3.5 !

#### WINDOWS ENVIRONMENT VARIABLES TO SET

1. **`COMMONLIB_SSE_FOLDER`**: The path to your clone of Commonlib.
2. **`VCPKG_ROOT`**: The path to your clone of [vcpkg](https://github.com/microsoft/vcpkg).
3. (optional) **`SKYRIM_FOLDER`**: path of your Skyrim Special Edition folder.
4. (optional) **`SKYRIM_MODS_FOLDER`**: path of the folder where your mods are.

#### THINGS TO EDIT

1. In LICENSE:
- **`YEAR`**
- **`YOURNAME`**
2. CMakeLists.txt
- **`AUTHORNAME`**
- **`MDDNAME`**
- (optional) Your plugin version. Default: `0.1.0.0`
3. vcpkg.json
- **`name`**: Your plugin's name.
- **`version-string`**: Your plugin version. Default: `0.1.0.0`

#### FEATURES
Automatically imports:
- [CLibUtil](https://github.com/powerof3/CLibUtil) by powerof3
- [SKSE Menu Framework](https://www.nexusmods.com/skyrimspecialedition/mods/120352) by Thiago099

## Fork: Skyrim 1.7.x (branch `og`)

This is the source the Nexus mod BFCO - Attack Behavior Framework links to. The published `og` head is older than the shipped DLL, so a build of it is close to, but not identical to, that DLL.

The old CommonLibVR build (`CMakeLists.txt`) hooks `MovementHandler` virtual slots 0x2 and 0x4. Skyrim 1.7.99 added two virtuals after `PlayerInputHandler::CanProcess`, so `ProcessThumbstick` and `ProcessButton` are now slots 0x4 and 0x6 (checked in the MovementHandler vtable of SkyrimSE.exe 1.7.104). Hooking the old slots on 1.7.x patched the base-class stub instead, so BFCO never saw the WASD keys and directional power attacks broke. `Hooks::Install` now picks the slots at runtime and logs them. `ng.cmake` builds `BFCO.dll` on alandtse's CommonLibSSE-NG for Skyrim 1.6.1170 and 1.7.x; it is included from a parent CMake project that defines `ng_plugin()` (a thin wrapper around `add_commonlibsse_plugin`).

import
  std/os,
  saohime,
  saohime/default_plugins,
  ../src/saohime_lua

proc pollEvent(appEvent: Event[ApplicationEvent]) {.system.} =
  for e in appEvent:
    let app = commands.getResource(Application)
    app.terminate()

proc importLuaVariables(
    luaDriver: Resource[LuaDriver]
) {.system.} =
  luaDriver.loadFile(getAppDir()/"integration.lua")
  echo luaDriver.getString(V1)
  echo luaDriver.getInteger(V2)

let app = Application.new()

app.loadPluginGroup(DefaultPlugins)
app.loadPlugin(LuaPlugin)

app.start:
  world.registerSystems(pollEvent)
  world.registerStartupSystems(importLuaVariables)


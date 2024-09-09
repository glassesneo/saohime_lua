import
  pkg/saohime,
  pkg/spellua,
  saohime_lua/systems

type
  LuaPlugin* = ref object

proc build*(plugin: LuaPlugin, world: World) =
  world.addResource(LuaDriver.new())
  world.registerTerminateSystems(closeLuaDriver)

export
  spellua


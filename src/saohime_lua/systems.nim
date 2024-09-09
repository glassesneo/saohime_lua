import
  pkg/saohime,
  pkg/spellua

proc closeLuaDriver*(driver: Resource[LuaDriver]) {.system.} =
  driver.close()


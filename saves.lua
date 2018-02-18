function load_settings()
      local path = system.pathForFile( "login.json", system.DocumentsDirectory )
      local file = io.open( path, "r" )
      if file then
          local saveData = file:read( "*a" )
          io.close( file )

          local jsonRead = json.decode(saveData)
          value = jsonRead.value

     else
          value = 1
     end end

function save_settings()
   local saveGame = {}
    if value then
    saveGame["value"] = value
     end

     local jsonSaveGame = json.encode(saveGame)

     local path = system.pathForFile( "login.json", system.DocumentsDirectory )
     local file = io.open( path, "w" )
      file:write( jsonSaveGame )
     io.close( file )
    file = nil
end
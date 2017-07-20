
--#############################################################################
--# Coronium SkyTable
--#############################################################################
local skytable = require("plugin.skytable")

skytable:init({
  user = "user@email.com",
  password = "userpw",
  base = "app1",
  key = "ab34b95ef9cc8b024bd184",
  host = "http://<skytable-ip>:7173",
  debug = true
})

local profile = skytable:open("profile")

local function setData()
  local d = {
    name = "Jimmy",
    active = true,
    colors = {"red", "green", "blue"},
    game = {
      level = 2,
      rank = "newbie"
    }
  }

  profile:set(d, function(evt)
    if evt.isError then
      print(evt.error)
    else
      if evt.success then
        print('saved')
      end
    end
  end)
end

local function getData()
  profile:get(function(evt)
    if evt.isError then
      print(evt.error)
    else
      print(evt.data)
    end
  end)
end

local function deleteData()
  profile:delete(function(evt)
    if evt.isError then
      print(evt.error)
    else
      print(evt.data)
    end
  end)
end

--setData()
--getData()
--deleteData()
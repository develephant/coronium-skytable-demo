--#############################################################################
--# Coronium SkyTable Demo
--#############################################################################

--#############################################################################
--# Require plugin
--#############################################################################
local skytable = require("plugin.skytable")

--#############################################################################
--# Initialize SkyTable
--#############################################################################
skytable:init({
  user = "user@email.com",
  password = "userpw",
  base = "app1",
  key = "ab34b95ef9cc8b024bd184",
  host = "http://<skytable-ip>:7173",
  debug = true
})

--#############################################################################
--# Open a "profile" SkyTable
--#############################################################################
local profile = skytable:open("profile")

--#############################################################################
--# Set Data
--#############################################################################
local function setData()
  -- Create data object
  local d = {
    name = "Jimmy",
    active = true,
    colors = {"red", "green", "blue"},
    game = {
      level = 2,
      rank = "newbie"
    }
  }

  -- Set data on "profile" SkyTable
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

--#############################################################################
--# Get Data
--#############################################################################
local function getData()
  -- Get data from "profile" SkyTable
  profile:get(function(evt)
    if evt.isError then
      print(evt.error)
    else
      print(evt.data)
    end
  end)
end

--#############################################################################
--# Delete data
--#############################################################################
local function deleteData()
  -- Delete data from "profile" SkyTable
  profile:delete(function(evt)
    if evt.isError then
      print(evt.error)
    else
      print(evt.data)
    end
  end)
end

--#############################################################################
--# Test Methods
--#############################################################################
--setData()
--getData()
--deleteData()
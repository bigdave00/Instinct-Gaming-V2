----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

Config = {}

Config.Debug = false -- Enables/disables debug messages

-- Core settings for renamed cores
Config.CoreSettings = {
    Core = 'QBCore', -- The name of your core. Default; QBCore
    CoreFolder = 'qb-core', -- The name of your core folder. Default; qb-core
    TargetName = 'qb-target', -- The name of your third eye targeting. Default; qb-target
    ManagementEvent = 'qb-gangmenu:client:OpenMenu', -- Name of your boss menu event. Default; 'qb-gangmenu:client:OpenMenu'
    ClothingEvent = 'illenium-appearance:client:openOutfitMenu', -- The name of your clothing event this is needed to open outfit menu. Default; 'illenium-appearance:client:OpenOutfitMenu'
}

-- Location settings
Config.Locations = {
    Management = {
        ['lostmc'] = { -- Ensure gang name here matches your shared/gangs.lua
            grade = 0, -- Grade able to view target option
            coords = vector3(57.497, 2792.372, 58.434), -- Coords for circlezonevector3(57.497, 2792.372, 58.434) --[vector4(57.497, 2792.372, 58.434, 0.0)]--
            radius = 0.5, -- Radius of circlezone
            distance = 1.5, -- Distance zone can be targeted
            useZ = true, -- Use Z coord above to place zone
            debugPoly = false -- Debug zone
        },
        ['thecartel'] = { -- Ensure gang name here matches your shared/gangs.lua
        grade = 3, -- Grade able to view target option
        coords = vector3(-1498.351, 127.001, 55.483), -- Coords for circlezone vector3(-1498.351, 127.001, 55.483) --[vector4(-1498.351, 127.001, 55.483, 0.0)]--
        radius = 0.5, -- Radius of circlezone
        distance = 1.5, -- Distance zone can be targeted
        useZ = true, -- Use Z coord above to place zone
        debugPoly = false -- Debug zone 
    },
    ['soa'] = { -- Ensure gang name here matches your shared/gangs.lua
      grade = 3, -- Grade able to view target option
      coords = vector3(977.65, -104.51, 74.84), -- Coords for circlezone
      radius = 0.5, -- Radius of circlezone
      distance = 1.5, -- Distance zone can be targeted
      useZ = true, -- Use Z coord above to place zone
      debugPoly = false -- Debug zone
},
['iyt'] = { -- Ensure gang name here matches your shared/gangs.lua
      grade = 3, -- Grade able to view target option
      coords = vector3(-317.13, -1352.54, 18.1), -- Coords for circlezone
      radius = 0.5, -- Radius of circlezone
      distance = 1.5, -- Distance zone can be targeted
      useZ = true, -- Use Z coord above to place zone
      debugPoly = false -- Debug zone
}, 
['widow'] = { -- Ensure gang name here matches your shared/gangs.lua vector3(180.608, -252.442, 53.87) --[vector4(180.608, -252.442, 53.87, 0.0)]--
      grade = 3, -- Grade able to view target option
      coords = vector3(180.608, -252.442, 53.87), -- Coords for circlezone
      radius = 0.5, -- Radius of circlezone
      distance = 1.5, -- Distance zone can be targeted
      useZ = true, -- Use Z coord above to place zone
      debugPoly = false -- Debug zone
},
['theskins'] = { -- Ensure gang name here matches your shared/gangs.lua vector3(180.608, -252.442, 53.87) --[vector4(180.608, -252.442, 53.87, 0.0)]-- vector3(-2673.937, 1312.63, 147.445) --[vector4(-2673.937, 1312.63, 147.445, 0.0)]--
      grade = 3, -- Grade able to view target option 
      coords = vector3(-2673.937, 1312.63, 147.445), -- Coords for circlezone
      radius = 0.5, -- Radius of circlezone
      distance = 1.5, -- Distance zone can be targeted thedom
      useZ = true, -- Use Z coord above to place zone
      debugPoly = false -- Debug zone
},
['thedons'] = { -- Ensure gang name here matches your shared/gangs.lua vector3(1275.989, -1710.043, 54.471) --[vector4(1275.989, -1710.043, 54.471, 0.0)]--
      grade = 3, -- Grade able to view target option 
      coords = vector3(439.648, -1895.501, 31.736), -- Coords for circlezone
      radius = 0.5, -- Radius of circlezone
      distance = 1.5, -- Distance zone can be targeted t
      useZ = true, -- Use Z coord above to place zone 
      debugPoly = false -- Debug zone
},
['davisgang'] = { -- Ensure gang name here matches your shared/gangs.lua vector3(1275.989, -1710.043, 54.471) --[vector4(1275.989, -1710.043, 54.471, 0.0)]--
      grade = 3, -- Grade able to view target option 
      coords = vector3(1275.989, -1710.043, 54.471), -- Coords for circlezone
      radius = 0.5, -- Radius of circlezone
      distance = 1.5, -- Distance zone can be targeted t
      useZ = true, -- Use Z coord above to place zone 
      debugPoly = false -- Debug zone
}
  },
    Stash = {
        ['lostmc'] = { -- Ensure gang name here matches your shared/gangs.lua vector3(52.917, 2792.316, 58.534) --[vector4(52.917, 2792.316, 58.534, 0.0)]--
            label = 'Lost MC Stash', -- Label used by inventory
            grade = 0, -- Grade able to view target option
            size = 100000, -- Stash storage size
            slots = 30, -- Stash storage slots
            raidtime = math.random(10,20), -- Time taken for service jobs to raid stash
            coords = vector3(52.917, 2792.316, 58.534), -- Coords for circlezone
            radius = 0.5, -- Radius of circlezone
            distance = 1.5, -- Distance zone can be targeted
            useZ = true, -- Use Z coord above to place zone
            debugPoly = false -- Debug zone
        },
['thecartel'] = { -- Ensure gang name here matches your shared/gangs.lua
          label = 'Cartel Stash', -- Label used by inventory vector3(-1496.109, 129.253, 55.683) --[vector4(-1496.109, 129.253, 55.683, 0.0)]--
          grade = 0, -- Grade able to view target option
          size = 10000000, -- Stash storage size
          slots = 300, -- Stash storage slots
          raidtime = math.random(10,20), -- Time taken for service jobs to raid stash
          coords = vector3(-1522.111, 70.178, 56.862), -- Coords for circlezone vector3(-1522.111, 70.178, 56.862) --[vector4(-1522.111, 70.178, 56.862, 0.0)]--
          radius = 0.5, -- Radius of circlezone
          distance = 1.5, -- Distance zone can be targeted
          useZ = true, -- Use Z coord above to place zone
          debugPoly = false -- Debug zone
},
      ['soa'] = { -- Ensure gang name here matches your shared/gangs.lua
      label = 'SOA Stash', -- Label used by inventory
      grade = 0, -- Grade able to view target option
      size = 1000000, -- Stash storage size
      slots = 300, -- Stash storage slots
      raidtime = math.random(10,20), -- Time taken for service jobs to raid stash
      coords = vector3(971.57, -98.38, 74.35), -- Coords for circlezone
      radius = 0.5, -- Radius of circlezone
      distance = 1.5, -- Distance zone can be targeted
      useZ = true, -- Use Z coord above to place zone
      debugPoly = false -- Debug zone
},
['iyt'] = { -- Ensure gang name here matches your shared/gangs.lua
      label = 'IYT Stash', -- Label used by inventory
      grade = 0, -- Grade able to view target option
      size = 1000000, -- Stash storage size
      slots = 300, -- Stash storage slots
      raidtime = math.random(10,20), -- Time taken for service jobs to raid stash
      coords = vector3(-310.06, -1362.46, 18.28), -- Coords for circlezone
      radius = 0.5, -- Radius of circlezone
      distance = 1.5, -- Distance zone can be targeted
      useZ = true, -- Use Z coord above to place zone
      debugPoly = false -- Debug zone
},
['widow'] = { -- Ensure gang name here matches your shared/gangs.lua
      label = 'White Widow Stash', -- Label used by inventory
      grade = 0, -- Grade able to view target option
      size = 1000000, -- Stash storage size
      slots = 300, -- Stash storage slots
      raidtime = math.random(10,20), -- Time taken for service jobs to raid stash
      coords = vector3(184.164, -244.761, 54.07), -- Coords for circlezone vector3(184.164, -244.761, 54.07) --[vector4(184.164, -244.761, 54.07, 0.0)]--
      radius = 0.5, -- Radius of circlezone
      distance = 1.5, -- Distance zone can be targeted
      useZ = true, -- Use Z coord above to place zone
      debugPoly = false -- Debug zone
},
['theskins'] = { -- Ensure gang name here matches your shared/gangs.lua
      label = 'The Skins Stash', -- Label used by inventory
      grade = 0, -- Grade able to view target option
      size = 1000000, -- Stash storage size
      slots = 300, -- Stash storage slots
      raidtime = math.random(10,20), -- Time taken for service jobs to raid stash
      coords = vector3(-2679.51, 1312.922, 147.445), -- Coords for circlezone vector3(184.164, -244.761, 54.07) --[vector4(184.164, -244.761, 54.07, 0.0)]-- vector3(-2679.51, 1312.922, 147.445) --[vector4(-2679.51, 1312.922, 147.445, 0.0)]--
      radius = 0.5, -- Radius of circlezone
      distance = 1.5, -- Distance zone can be targeted
      useZ = true, -- Use Z coord above to place zone
      debugPoly = false -- Debug zone
},
['thedons'] = { -- Ensure gang name here matches your shared/gangs.lua
      label = 'The Dons Stash', -- Label used by inventory
      grade = 0, -- Grade able to view target option
      size = 1000000, -- Stash storage size vector3(434.01, -1885.799, 31.536) --[vector4(434.01, -1885.799, 31.536, 0.0)]--
      slots = 300, -- Stash storage slots
      raidtime = math.random(10,20), -- Time taken for service jobs to raid stash
      coords = vector3(434.01, -1885.799, 31.536), -- Coords for circlezone vector3(1279.578, -1717.899, 55.271) --[vector4(1279.578, -1717.899, 55.271, 0.0)]--
      radius = 0.5, -- Radius of circlezone
      distance = 1.5, -- Distance zone can be targeted
      useZ = true, -- Use Z coord above to place zone
      debugPoly = false -- Debug zone
},
['davisgang'] = { -- Ensure gang name here matches your shared/gangs.lua
      label = 'Davis Gang Stash', -- Label used by inventory
      grade = 0, -- Grade able to view target option
      size = 1000000, -- Stash storage size vector3(434.01, -1885.799, 31.536) --[vector4(434.01, -1885.799, 31.536, 0.0)]--
      slots = 300, -- Stash storage slots
      raidtime = math.random(10,20), -- Time taken for service jobs to raid stash
      coords = vector3(1279.578, -1717.899, 55.271), -- Coords for circlezone vector3(1279.578, -1717.899, 55.271) --[vector4(1279.578, -1717.899, 55.271, 0.0)]--
      radius = 0.5, -- Radius of circlezone
      distance = 1.5, -- Distance zone can be targeted vector3(1279.578, -1717.899, 55.271) --[vector4(1279.578, -1717.899, 55.271, 0.0)]--
      useZ = true, -- Use Z coord above to place zone
      debugPoly = false -- Debug zone
}
    },
    Wardrobe = {
        ['lostmc'] = { -- Ensure gang name here matches your shared/gangs.lua
            grade = 0, -- Grade able to view target option
            coords = vector3(46.282, 2801.46, 57.883), -- Coords for circlezonevector3(46.282, 2801.46, 57.883) --[vector4(46.282, 2801.46, 57.883, 0.0)]--
            radius = 0.5, -- Radius of circlezone
            distance = 1.5, -- Distance zone can be targeted
            useZ = true, -- Use Z coord above to place zone
            debugPoly = false -- Debug zone
        },
        ['thecartel'] = { -- Ensure gang name here matches your shared/gangs.lua
        grade = 0, -- Grade able to view target option
        coords = vector3(-1502.87, 114.41, 55.58), -- Coords for circlezone
        radius = 0.5, -- Radius of circlezone
        distance = 1.5, -- Distance zone can be targeted
        useZ = true, -- Use Z coord above to place zone
        debugPoly = false -- Debug zone
    },
    ['soa'] = { -- Ensure gang name here matches your shared/gangs.lua
     grade = 0, -- Grade able to view target option
     coords = vector3(987.25, -93.3, 74.31), -- Coords for circlezone
     radius = 0.5, -- Radius of circlezone
     distance = 1.5, -- Distance zone can be targeted
     useZ = true, -- Use Z coord above to place zone
     debugPoly = false -- Debug zone
},
['iyt'] = { -- Ensure gang name here matches your shared/gangs.lua
     grade = 0, -- Grade able to view target option
     coords = vector3(-319.19, -1356.53, 18.28), -- Coords for circlezone
     radius = 0.5, -- Radius of circlezone
     distance = 1.5, -- Distance zone can be targeted
     useZ = true, -- Use Z coord above to place zone
     debugPoly = false -- Debug zone
},
['widow'] = { -- Ensure gang name here matches your shared/gangs.lua
     grade = 0, -- Grade able to view target option
     coords = vector3(183.437, -238.731, 54.07), -- Coords for circlezone vector3(183.437, -238.731, 54.07) --[vector4(183.437, -238.731, 54.07, 0.0)]--
     radius = 0.5, -- Radius of circlezone
     distance = 1.5, -- Distance zone can be targeted
     useZ = true, -- Use Z coord above to place zone
     debugPoly = false -- Debug zone
},
['theskins'] = { -- Ensure gang name here matches your shared/gangs.lua
     grade = 0, -- Grade able to view target option
     coords = vector3(-2675.963, 1304.602, 152.014), -- Coords for circlezone vector3(-2675.963, 1304.602, 152.014) --[vector4(-2675.963, 1304.602, 152.014, 0.0)]--
     radius = 0.5, -- Radius of circlezone
     distance = 1.5, -- Distance zone can be targeted
     useZ = true, -- Use Z coord above to place zone
     debugPoly = false -- Debug zone
},
['thedons'] = { -- Ensure gang name here matches your shared/gangs.lua
     grade = 0, -- Grade able to view target option
     coords = vector3(436.672, -1889.425, 31.737), -- Coords for circlezone vector3(-2675.963, 1304.602, 152.014) --[vector4(-2675.963, 1304.602, 152.014, 0.0)]--
     radius = 0.5, -- Radius of circlezone
     distance = 1.5, -- Distance zone can be targeted
     useZ = true, -- Use Z coord above to place zone vector3(436.672, -1889.425, 31.737) --[vector4(436.672, -1889.425, 31.737, 0.0)]--
     debugPoly = false -- Debug zone
},
['davisgang'] = { -- Ensure gang name here matches your shared/gangs.lua
     grade = 0, -- Grade able to view target option
     coords = vector3(1271.529, -1715.517, 54.771), -- Coords for circlezone vector3(-2675.963, 1304.602, 152.014) --[vector4(-2675.963, 1304.602, 152.014, 0.0)]--
     radius = 0.5, -- Radius of circlezone
     distance = 1.5, -- Distance zone can be targeted
     useZ = true, -- Use Z coord above to place zone vector3(436.672, -1889.425, 31.737) --[vector4(436.672, -1889.425, 31.737, 0.0)]-- vector3(1271.529, -1715.517, 54.771) --[vector4(1271.529, -1715.517, 54.771, 0.0)]--
     debugPoly = false -- Debug zone
}
},
}



-- Service jobs
Config.Services = {
    --[[
        NOTES:

        - NAME = YOUR JOB NAME IN SHARED
        - GRADE = GRADE ABLE TO VIEW TARGET OPTION TO FORCE ENTRY INTO STASH
    ]]
    {name = 'police', grade = 1}

    -- You can add as many jobs here as required. Example below;
    -- {name = 'police', grade = 1},
    -- {name = 'dea', grade = 1},
    -- {name = 'fib', grade = 1}
}

-- Animation settings
Config.Animations = {
    Raid = {
        Dict = 'mini@safe_cracking',
        Anim = 'door_open_succeed_stand',
        Flags = 49
    }
}
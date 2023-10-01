-- Zones for Menues
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = {
        vector3(460.57652, -1007.438, 35.931091),
    },
    ['ambulance'] = {
        vector3(-1832.319, -339.942, 49.365), 
    },
    ['realestate'] = {
        vector3(-716.11, 261.21, 84.14),
    },
    ['taxi'] = {
        vector3(907.24, -150.19, 74.17),
    },
    ['cardealer'] = {
        vector3(-2211.076, -390.547, 13.186),
    },
    ['uwu'] = {
        vector3(-596.26, -1053.52, 21.85),
    },
    ['burgershot'] = {
        vector3(-1196.808, -901.766, 13.895),
    },
    ['lawyer'] = {
        vector3(-582.641, -347.258, 34.955),
    },
    ['whitewidow'] = {
        vector3(183.39, -251.191, 53.971),
    },
    ['bahama'] = {
        vector3(-1370.308, -625.918, 30.158),
    },
    
    
}

Config.BossMenuZones = {
    ['police'] = {
        { coords = vector3(460.57652, -1007.438, 35.931091), length = 0.35, width = 0.45, heading = 351.0, minZ = 34.9, maxZ = 36. } ,
        { coords = vector3(359.57, -1591.21, 31.05), length = 1.4, width = 0.6, heading = 139.0, minZ = 27.05, maxZ = 31.05 } ,
        { coords = vector3(1826.05, 3671.85, 38.86), length = 0.8, width = 1, heading = 120.0, minZ = 35.26, maxZ = 39.26 } ,
        { coords = vector3(-577.19, -939.01, 28.7), length = 0.6, width = 0.9, heading = 269.0, minZ = 27.7, maxZ = 31.7 } ,
        { coords = vector3(-577.19, -939.01, 28.7), length = 0.8, width = 1, heading = 135.0, minZ = 33.4, maxZ = 37.4 } ,   },
    ['ambulance'] = {
        { coords = vector3(-1832.319, -339.942, 49.365), length = 1.0, width = 1.0, heading = 1.0, minZ = 48.865, maxZ = 49.865 },
        { coords = vector3(-250.26, 6310.62, 32.41), length = 1.2, width = 0.6, heading = 225.0, minZ = 28.81, maxZ = 32.81 },
    },
    ['realestate'] = {
        { coords = vector3(-716.11, 261.21, 84.14), length = 0.6, width = 1.0, heading = 25.0, minZ = 83.943, maxZ = 84.74 },
    },
    ['taxi'] = {
        { coords = vector3(907.24, -150.19, 74.17), length = 1.0, width = 3.4, heading = 327.0, minZ = 73.17, maxZ = 74.57 },
    },
    ['cardealer'] = {
        { coords = vector3(-2211.076, -390.547, 13.186), length = 1.0, width = 1.0, heading = 0.0, minZ = 12.686, maxZ = 13.686 }, 
    },
    ['uwu'] = {
        { coords = vector3(-596.26, -1053.52, 21.85), length = 1.15, width = 2.6, heading = 353.0, minZ = 43.59, maxZ = 44.99 },
    },
    ['burgershot'] = {
        { coords =  vector3(-1196.808, -901.766, 13.895), length = 1.15, width = 2.6, heading = 353.0, minZ = 43.59, maxZ = 44.99 },
    },
    ['lawyer'] = {
        { coords =  vector3(-582.641, -347.258, 34.955), length = 1.0, width = 1.0, heading = 0.0, minZ = 34.455, maxZ = 35.455 }, 
    },
    ['whitewidow'] = {
        { coords = vector3(183.39, -251.191, 53.971), length = 1.0, width = 2.6, heading = 353.0, minZ = 53.471, maxZ = 54.471 },
    },
}

Config.GangMenus = {
    ['lostmc'] = {
        vector3(0, 0, 0),
    },
    ['ballas'] = {
        vector3(0, 0, 0),
    },
    ['vagos'] = {
        vector3(0, 0, 0),
    },
    ['cartel'] = {
        vector3(0, 0, 0),
    },
    ['families'] = {
        vector3(0, 0, 0),
    },
}

Config.GangMenuZones = {
    --[[
    ['gangname'] = {
        { coords = vector3(0.0, 0.0, 0.0), length = 0.0, width = 0.0, heading = 0.0, minZ = 0.0, maxZ = 0.0 },
    },
    ]]
}

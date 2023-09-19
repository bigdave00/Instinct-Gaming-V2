Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

local isServer = IsDuplicityVersion()
if not isServer then
    --- This function will be triggered once the hack is done
    --- @param success boolean
    --- @param currentGate number
    --- @param gateData table
    --- @return nil
    function Config.OnHackDone(success, currentGate, gateData)
        if success then
            TriggerServerEvent("prison:server:SetGateHit", currentGate)
            TriggerServerEvent('qb-doorlock:server:updateState', gateData.gatekey, false, false, false, true)
        else
            TriggerServerEvent("prison:server:SecurityLockdown")
        end
        TriggerEvent('mhacking:hide')
    end
end

Config.Jobs = {
    ["electrician"] = "Electrician"
}

Config.Uniforms ={
    ['male'] = {
        outfitData ={
            ['t-shirt'] = {item = 15, texture = 0},
            ['torso2'] = {item = 345, texture = 0},
			['arms'] = {item = 19, texture = 0},
			['pants'] = {item = 3, texture = 7},
			['shoes'] = {item = 1, texture = 0},
        }
    },
    ['female'] = {
        outfitData ={
            ['t-shirt'] = {item = 14, texture = 0},
			['torso2'] = {item = 370, texture = 0},
			['arms'] = {item = 0, texture = 0},
			['pants'] = {item = 0, texture = 12},
			['shoes'] = {item = 1, texture = 0},
        }
    },
}

Config.Locations = {
    jobs = {
        ["electrician"] = { 
            [1] = { 
                coords = vector4(1694.7473144531, 2469.810546875, 45.628089904785, 178.8072052002),
            },
            [2] = { 
                coords = vector4(1683.9591064453, 2509.4475097656, 45.555805206299, 45.572402954102)
            },
            [3] = { 
                coords = vector4(1630.4953613281, 2527.2097167969, 45.552856445313, 229.47850036621)
            },
            [4] = { 
                coords = vector4(1652.8852539063, 2564.3686523438, 45.552768707275, 328.32415771484)
            },
            [5] = { 
                coords = vector4(1617.3372802734, 2578.3198242188, 45.552772521973, 73.143394470215)
            },
            [6] = { 
                coords = vector4(1714.408203125, 2532.6882324219, 45.552822113037, 31.258987426758)
            },
            [7] = { 
                coords = vector4(1750.2331542969, 2542.4211425781, 45.552829742432, 20.348846435547)
            },
        },
        
    },
    ["freedom"] = {
        coords = vector4(1776.8502197266, 2490.2336425781, 49.425926208496, 33.6081199646)
    },
    ["outside"] = {
        coords = vector4(1848.13, 2586.05, 44.67, 269.5) 
    },
    ["yard"] = {
        coords = vector4(1760.9948730469, 2486.2600097656, 45.740795135498, 123.1)
    },
    ["middle"] = {
        coords = vector4(1693.33, 2569.51, 44.55, 123.5)
    },
    ["shop"] = {
        coords = vector4(1780.9367675781, 2560.7770996094, 44.6731300354, 183.45219421387)
    },
    ["medical"] = {
        coords = vector4(1765.6243896484, 2568.484375, 45.729892730713, 183.45219421387)
    },
    ["takephoto"] = {
        coords = vector4(1844.35, 2594.31, 45.02, 93.08)
    },
    spawns = {
        [1] = {
            animation = "smoke",
            coords = vector4(1742.6776123047,  2487.8022460938, 45.815952301025, 211.47511291504),
        },
        [2] = {
            animation = "smoke",
            coords = vector4(1745.7604980469,  2489.3930664062, 45.816871643066, 214.17747497559),
        },
        [3] = {
            animation = "smoke",
            coords = vector4(1748.9201660156,  2490.8937988281, 45.817798614502, 211.51902770996),
        },
        [4] = {
            animation = "smoke",
            coords = vector4(1751.7316894531,  2492.7883300781, 45.81888961792, 208.35942077637),
        },
        [5] = {
            animation = "smoke",
            coords = vector4(1754.9354248047,  2494.2917480469, 45.819816589355, 210.07917785645),
        },
        [6] = {
            animation = "smoke",
            coords = vector4(1760.7355957031,  2498.0964355469, 45.821849822998, 207.9994354248),
        },
        [7] = {
            animation = "smoke",
            coords = vector4(1763.7365722656,  2500.0915527344, 45.822906494141, 207.63250732422),
        },
        [8] = {
            animation = "smoke",
            coords = vector4(1772.9423828125,  2482.2905273438, 45.817798614502, 23.773572921753),
        },
        [9] = {
            animation = "smoke",
            coords = vector4(1770.0659179688,  2480.2082519531, 45.81672668457, 21.109958648682),
        },
        [10] = {
            animation = "smoke",
            coords = vector4( 1766.8334960938,  2479.0124511719, 45.815902709961, 26.327472686768), 
        },
        [11] = {
            animation = "smoke",
            coords = vector4( 1764.1934814453,  2476.7314453125, 45.814792633057, 17.753391265869), 
        },
        [12] = {
            animation = "smoke",
            coords = vector4( 1761.1491699219,  2475.2548828125, 45.813903808594, 38.479640960693), 
        },
        [13] = {
            animation = "smoke",
            coords = vector4( 1758.0048828125,  2473.5463867188, 45.812885284424, 28.693769454956), 
        },
        [14] = {
            animation = "smoke",
            coords = vector4(1751.9049072266,  2470.0852050781, 45.810882568359, 29.600395202637), 
        },
        [15] = {
            animation = "smoke",
            coords = vector4(1773.1676025391,  2482.0554199219, 50.422634124756, 31.381858825684), 
        },
        [16] = {
            animation = "smoke",
            coords = vector4(1770.0296630859,  2480.6806640625, 50.421733856201, 49.06595993042), 
        },
        [17] = {
            animation = "smoke",
            coords = vector4(1766.9644775391,  2478.9172363281, 50.420734405518, 24.324253082275), 
        },
        [18] = {
            animation = "smoke",
            coords = vector4(1764.2296142578,  2476.72265625, 50.419620513916, 25.936822891235), 
        },
        [19] = {
            animation = "smoke",
            coords = vector4(1761.001953125,  2475.4350585938, 50.418781280518, 29.768964767456),
        },
        [20] = {
            animation = "smoke",
            coords = vector4(1757.9056396484,  2473.9213867188, 50.41788482666, 25.852527618408), 
        },
        [21] = {
            animation = "smoke",
            coords = vector4(1754.9578857422,  2471.7631835938, 50.416770935059, 18.973287582397), 
        },
        [22] = {
            animation = "smoke",
            coords = vector4(1752.2028808594,  2470.0104980469, 50.415790557861, 27.73934173584), 
        },
        [23] = {
            animation = "smoke",
            coords = vector4(1742.7174072266,  2487.8227539062, 50.420875549316, 205.54008483887),
        },
        [24] = {
            animation = "smoke",
            coords = vector4(1748.6784667969,  2491.125, 50.422775268555, 205.55201721191),
        },
        [25] = {
            animation = "smoke",
            coords = vector4(1751.4876708984,  2492.9560546875, 50.423767089844, 210.98672485352), 
        },
        [26] = {
            animation = "smoke",
            coords = vector4(1754.6606445312,  2494.7946777344, 50.424766540527, 204.01666259766), 
        },
        [27] = {
            animation = "smoke",
            coords = vector4(1757.7556152344,  2496.4028320312, 50.425724029541, 209.74240112305), 
        },
        [28] = {
            animation = "smoke",
            coords = vector4(1763.6369628906,  2500.1228027344, 50.427772521973, 203.13409423828), 
        },
    }
}

Config.CanteenItems = {
    [1] = {
        name = "sandwich",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 1
    },
    [2] = {
        name = "water_bottle",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 2
    }
}

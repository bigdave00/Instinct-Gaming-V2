
Config = {}
Config.Debug = false -- \ Set to true to enable debugging
Config.Core = "qb-core" -- \ The name of the core (Default: qb-core)
Config.Target = "qb-target" -- \ The target name (Default: qb-target)
Config.MinimumCops = 0 -- \ Minimum cops required to sell drugs
Config.GiveBonusOnPolice = true -- \ Give bonus on selling drugs to police (Edit on server side)
Config.ChanceSell = 100 -- \ Chance to sell drug (in %)
Config.Zones = { -- \ Sell zones (these zones are linked with the certain drugs check below)
    ['groove'] = {
		points = {
            vector2(250.90760803223, -1866.3974609375),
            vector2(146.70475769043, -1990.5447998047),
            vector2(130.3134765625, -2034.3944091797),
            vector2(95.291275024414, -2030.4129638672),
            vector2(88.095336914062, -2009.6634521484),
            vector2(68.878730773926, -1978.8924560547),
            vector2(-153.59761047363, -1779.4030761719),
            vector2(-97.692588806152, -1750.6363525391),
            vector2(-50.927833557129, -1733.6020507812),
            vector2(49.590217590332, -1689.9705810547)
        },
        minZ = 18.035144805908,
        maxZ = 75.059997558594,
    },
    ['groove2'] = {
		points = {
            vector2(-1387.3806152344, -1077.8570556641),
            vector2(-1503.7690429688, -1074.7030029297),
            vector2(-1514.4014892578, -1017.4389038086),
            vector2(-1459.6896972656, -960.01196289063),
            vector2(-1370.1341552734, -1016.7723999023),
            vector2(-1346.7983398438, -1122.6042480469),
            vector2(-1326.5570068359, -1303.8240966797),
            vector2(-1422.3452148438, -1295.1345214844)
        },
         minZ = 4.2127404212952,
         maxZ = 7.5924868583679,
    },
}

Config.ZoneDrugs = { -- \ Names should be same as zone names
    [1] = {zone="sellzonegroove", item = 'cokebaggy', price = math.random(1000, 2000)},
    [2] = {zone="sellzonegroove", item = 'meth', price = math.random(1000, 2000)},
    [3] = {zone="sellzonegroove2", item = 'cokebaggy', price = math.random(1000, 2000)},
    [4] = {zone="sellzonegroove2", item = 'meth', price = math.random(1000, 2000)},
}

Config.BlacklistPeds = { -- \ Ped models that should be blacklisted
    "mp_m_shopkeep_01",
    "s_m_y_ammucity_01",
    "mp_m_weapexp_01",
    "ig_bankman",
    "S_F_Y_Casino_01",
    "cs_lifeinvad_01",
    "mp_m_waremech_01",
    "ig_hunter",
    "s_m_y_construct_01",
    "a_f_y_business_01",
}
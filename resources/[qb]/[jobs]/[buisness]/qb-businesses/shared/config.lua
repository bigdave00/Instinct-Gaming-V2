Config = {}

Config.debugPoly = false ---- ** Will Debug every single business
Config.Debug = false -- Turns to true and it will enable f8 prints to debug issues with Ingredients
Config.FileDict = "qb-inventory/html/"

---- ** Types of products for food ** ----
-- Oil
-- Protein
-- Vegetables
-- Leavening
-- Diary
-- Grain
-- Seasoning
-- Sugar

Config.WashCounter = 15 -- How much food can they make before their hands get dirty
Config.ZoneDuty = true -- This will automatically make an employee go on duty when they enter the zone and off duty when they leave the zone

Config.LimitChecks = 3 -- How many times does the Config.Limits have to be passed before getting a buff
Config.Limits = 25 -- How many Value points should a product type have before it affects diet? Default 25

Config.EnableRegister = true -- Enable or disable cash registers for payment systems
Config.EnableCommission = true -- Enable or disable commission for sales
Config.PlayerCommission = 5 -- % of the total sale the player recieves as commission

Config.Society = "qb-management" -- qb-managment or qb-bossmenu or simplebanking or Renewed-Banking
Config.UseQBManagement = true -- Set to TRUE if you are using qb-management as it will give the manager menu more options

Config.Menu = "qb-menu" -- Change this if you renamed qb-menu or use a different menu that is compatible with qb-menu
Config.Input = "qb-input" -- Change this if you renamed qb-input or use a different input that is compatible with qb-input
Config.Core = "qb-core" -- Change this if you use a renamed core MUST be up to date with latest qb-core

Config.MaxActiveRecipes = 4 -- How many recipes can the player have active at the same time

Config.EnableBuffs = true -- Whether or not you want buff active for food and water (MUST USE PS HUD AND PS BUFFS)

Config.SitBuff = true -- If you want people to get better buffs and food/water when sitting down
Config.SitTimer = 0 -- How long should the player sit down for to get the buff (seconds)
Config.SitEffectHunger = true -- Weather or not sitting should only effect buffs and NOT hunger
Config.SitEffectWater = true -- Weather or not sitting should only effect buffs and NOT water
Config.SitBuffPercent = 1.25 -- How much should the buff be increased by NORMAL 1.25 WHICH MEANS 25% MORE BUFFS AND FOOD AND WATER if enabled


Config.IngredientsSpam = true -- Makes it so spamming the same ingredient in a recipe will make x ingredient worse
Config.IngredientSpamLimit = 3 -- How many times can you spam the same ingredient before it gets worse

Config.TimeToCook = {
    ["drinks"] = 5000,
    ["main"] = 5000,
    ["side"] = 5000,
    ["dessert"] = 5000,
}

Config.Ingredients = { -- Value = food points that it replenish,  sugarAmt is used for buffs etc too much sugar bad right amount speed buff etc.
    ["Main"] = {
        -- Read server/foodbuffs, to see when these gets triggered.

        -- Currently supports the following types for doing buffs (requires ps-buffs), and their hud made by Silent#2021
        -- healthy // BUFF, $ makes it so you can make more $ when consuming healthy food
        -- dairy // BUFF, destresses you when consuming dairy
        -- protein // Buff, more inventory space after consuming protein ** // Not implemented yet as this requires inventory edits.
        -- grain // BUFF, makes it so your food dont deteriate that quick.
        -- seasoning // BUFF, $ makes it so you can make more $ when consuming flavourfull food
        -- sugar // BUFF, makes it so you run faster for a limited time period.
        -- Super foods // Makes hacking easier for a small period of time

        -- RP Buffs, makes it so buffs last longer by being arround businesses you dont own.



        -- Also ordered all the secondary values in number order that way you can change it however you'd like.
        ---- ALL THE HEALTHY FOOD ----
        ["apples"]          = {       name = "apples",          Value = 4,       healthyAmt = 4},
        ["pineapple"]       = {       name = "pineapple",       Value = 4,       healthyAmt = 4},
        ["lettuce"]         = {       name = "lettuce",         Value = 3,       healthyAmt = 4},
        ["pumpkin"]         = {       name = "pumpkin",         Value = 5,       healthyAmt = 4},
        ["blueberry"]       = {       name = "blueberry",       Value = 3,       healthyAmt = 3},
        ["tomato"]          = {       name = "tomato",          Value = 3,       healthyAmt = 3},
        ["basil"]           = {       name = "basil",           Value = 4,       healthyAmt = 2},
        ["pickle"]          = {       name = "pickle",          Value = 3,       healthyAmt = 2},
        ["orange"]          = {       name = "orange",          Value = 3,       healthyAmt = 2},
        ["slicedpotato"]    = {       name = "slicedpotato",    Value = 3,       healthyAmt = 2},
        ["slicedonion"]     = {       name = "slicedonion",     Value = 3,       healthyAmt = 1},


        ---- ALL THE DAIRY PRODUCTS ----
        ["icecream"]        = {       name = "icecream",        Value = 4,       dairyAmt = 3},
        ["milk"]            = {       name = "milk",            Value = 4,       dairyAmt = 3},
        ["cheddar"]         = {       name = "cheddar",         Value = 4,       dairyAmt = 3},
        ["mozz"]            = {       name = "mozz",            Value = 4,       dairyAmt = 3},
        ["cream"]           = {       name = "cream",           Value = 3,       dairyAmt = 2},


        ---- ALL THE PROTEIN PRODUCTS ----
        ["beef"]            = {       name = "beef",            Value = 7,       proteinAmt = 4},
        ["salami"]          = {       name = "salami",          Value = 8,       proteinAmt = 4},
        ["packagedchicken"] = {       name = "packagedchicken", Value = 7,       proteinAmt = 4},
        ["wholeham"]        = {       name = "wholeham",        Value = 8,       proteinAmt = 3},
        ["tofu"]            = {       name = "tofu",            Value = 9,       proteinAmt = 3},
        ["fish"]            = {       name = "fish",            Value = 8,       proteinAmt = 2},
        ["peperoni"]        = {       name = "peperoni",        Value = 8,       proteinAmt = 1},

        ---- ALL THE GRAIN PRODUCTS ----
        ["flour"]           = {       name = "flour",           Value = 3,       grainAmt = 4},
        ["noodles"]         = {       name = "noodles",         Value = 5,       grainAmt = 3},
        ["pasta"]           = {       name = "pasta",           Value = 5,       grainAmt = 3},

        ---- ALL THE SEASONING ----
        ["flavouring"]      = {       name = "flavouring",      Value = 1,       falvouringAmt = 5}, -- Pack of flavouring

        ---- ALL THE SUGAR // HUNHEALTHY STUFF ----
        ["sugar"]           = {       name = "sugar",           Value = 3,       sugarAmt = 10},
        ["chocolate"]       = {       name = "chocolate",       Value = 2,       sugarAmt = 6},
        ["ketchup"]         = {       name = "ketchup",         Value = 2,       sugarAmt = 4},
        ["crisps"]          = {       name = "crisps",          Value = 2,       sugarAmt = 3},
        ["nachos"]          = {       name = "nachos",          Value = 3,       sugarAmt = 3},



        ---- ALL THE OTHER STUFF THAT HAS NO BUFF EFFECTS ----
        ["boba"]            = {       name = "boba",            Value = 3},
        ["coffeebean"]      = {       name = "coffeebean",      Value = 4},
        ["eggs"]            = {       name = "eggs",            Value = 5},
        ["frozennugget"]    = {       name = "frozennugget",    Value = 4},
        ["granola"]         = {       name = "granola",         Value = 4},
        ["mint"]            = {       name = "mint",            Value = 3},
        ["nori"]            = {       name = "nori",            Value = 5},
        ["rice"]            = {       name = "rice",            Value = 3},
        ["rose_oil"]        = {       name = "rose_oil",        Value = 1},
        ["rum"]             = {       name = "rum",             Value = 5},
        ["sauce"]           = {       name = "sauce",           Value = 1},
        ["yeast"]           = {       name = "yeast",           Value = 3},


                --["pizzadough"]      = {       name = "pizzadough",      Value = 5,       sugarAmt = 3},
        [42]                = {       name = "none",            Value = 0},
    },

    ["Drinks"] = {
        ["vodka"]                = {       name = "vodka",           Value = 6,      sugarAmt = 2,       alcoholAmt = 3},
        ["curaco"]               = {       name = "curaco",          Value = 6,      sugarAmt = 2,       alcoholAmt = 2},
        ["schnapps"]             = {       name = "schnapps",        Value = 7,      sugarAmt = 3,       alcoholAmt = 2},
        ["gin"]                  = {       name = "gin",             Value = 5,      sugarAmt = 3,       alcoholAmt = 2},
        ["scotch"]               = {       name = "scotch",          Value = 6,      sugarAmt = 3,       alcoholAmt = 2},
        ["rum"]                  = {       name = "rum",             Value = 5,      sugarAmt = 3,       alcoholAmt = 2},
        ["amaretto"]             = {       name = "amaretto",        Value = 5,      sugarAmt = 3,       alcoholAmt = 2},
        ["icream"]               = {       name = "icream",          Value = 6,      sugarAmt = 5},
        ["cranberry"]            = {       name = "cranberry",       Value = 2,      sugarAmt = 2},
        ["strawberry"]           = {       name = "strawberry",      Value = 4,      sugarAmt = 2},
        ["apples"]               = {       name = "apples",          Value = 4,      sugarAmt = 2},
        ["pineapple"]            = {       name = "pineapple",       Value = 5,      sugarAmt = 2},
        ["blueberry"]            = {       name = "blueberry",       Value = 3,      sugarAmt = 2},
        ["orange"]               = {       name = "orange",          Value = 3,      sugarAmt = 2},
        ['water_bottle']         = {       name = "water_bottle",    Value = 12},
        ['coffeebean']           = {       name = "coffeebean",      Value = 5},
        ['milk']                 = {       name = "milk",            Value = 7},
        ['cream']                = {       name = "cream",           Value = 5},
        ['icecream']             = {       name = "icecream",        Value = 5},

        ['none']                 = {       name = "none",            Value = 0},
    },

    ["EmotesF"] = { -- all the EATING emotes
        "donut",
        "burger",
        "sandwich",
        "egobar",
    },

    ["EmotesD"] = { -- all the DRINKING emotes
        "coffee",
        "whiskey",
        "beer",
        "cup",
        "soda",
        "wine",
        "flute",
        "champagne",
    },
}

Config.Blips = { -- https://wiki.rage.mp/index.php?title=Blips
    [1] = {
        label = "Pizza This", -- Blip name
        coords = vector3(804.96, -750.72, 26.77), -- Blip location
        blip = 267, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 46 -- Blip color
    },

    [2] = {
        label = "Burgershot", -- Blip name
        coords = vector3(-1190.31, -888.4, 13.97), -- Blip location
        blip = 106, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 5 -- Blip color
    },

    [3] = {
        label = "Hen house", -- Blip name
        coords = vector3(-294.48, 6265.72, 35.59), -- Blip location
        blip = 80, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 47 -- Blip color
    },
}

Config.BusinessManager = {
    ["pizza"] = {
        coords = vector3(797.16, -751.48, 31.27), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.3, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["pizza"] = 2}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    },


    ["burgershot"] = {
        coords = vector3(-1198.143, -898.536, 13.598), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.56, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["burgershot"] = 3}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    },

    ["henhouse"] = {
        coords = vector3(-294.48, 6265.72, 34.59), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.56, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["henhouse"] = 3}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    },

    ["tequilala"] = {
        coords = vector3(-562.91, 279.02, 83.3), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.56, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["tequilala"] = 3}, -- Which job and grade should have access to change and access menu?
        type = {Food = false, Drink = true} -- Type of items the business is authorized to sell
    },
    ["popsdiner"] = {
        coords = vector3(1595.33, 6455.4, 25.91), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.56, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["popsdiner"] = 3}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    }
}

Config.DUI = {
    ["pizza"] = { -- Match this with business zone and job name (Case Sensitive!)
        [1] = { -- Main Menu
            coords = vector3(814.09, -755.02, 28.20), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 1.2,
            ytd = 'sm_pizzeria_txd_02', -- This has to be the Dictionsiary YTD File
            ytdname = "pizzeria_menu", -- This will be the name of the object INSIDE the YTD File
            width = 512, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 512, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 1, -- This is the ID of the shop, has to be unique
            job = {["pizza"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },

        [2] = { -- Drinks Menu
            coords = vector3(813.79, -751.06, 28.75), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 1.2,
            ytd = 'sm_pizzeria_txd_02', -- This has to be the Dictionsiary YTD File
            ytdname = "pizzeria_dinks", -- This will be the name of the object INSIDE the YTD File
            width = 512, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 512, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 2, -- This is the ID of the shop, has to be unique
            job = {["pizza"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },
    },



    ["popsdiner"] = { -- Match this with business zone and job name (Case Sensitive!)
        [1] = { -- UwU Café paintings
            coords = vector3(1589.26, 6458.5, 26.85), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 1.2,
            ytd = 'gabz_diner_mtxdict', -- This has to be the Dictionsiary YTD File t_m_catcafe_imageatlas02
            ytdname = "Gabz_diner_menuboard_base_A", -- This will be the name of the object INSIDE the YTD File
            width = 1024, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 1024, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 1, -- This is the ID of the shop, has to be unique
            job = {["popsdiner"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },
    },

    ["burgershot"] = { -- Match this with business zone and job name (Case Sensitive!)
        [1] = { -- UwU Café paintings
            coords = vector3(-1193.86, -898.55, 15.29), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 1.5,
            ytd = 'gn_burgershot_graphi', -- This has to be the Dictionsiary YTD File gn_burgershot_graphi
            ytdname = "gn_tv_screen_b", -- This will be the name of the object INSIDE the YTD File
            width = 1024, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 1024, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 1, -- This is the ID of the shop, has to be unique
            job = {["burgershot"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },
        [2] = { -- UwU Café paintings
            coords = vector3(-1194.84, -897.2, 15.29), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 1.5,
            ytd = 'gn_burgershot_graphi', -- This has to be the Dictionsiary YTD File gn_burgershot_graphi
            ytdname = "gn_tv_screen_scrolling", -- This will be the name of the object INSIDE the YTD File
            width = 1024, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 1024, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 2, -- This is the ID of the shop, has to be unique
            job = {["burgershot"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },
        [3] = { -- UwU Café paintings
            coords = vector3(-1195.97, -895.84, 15.45), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 1.5,
            ytd = 'gn_burgershot_graphi', -- This has to be the Dictionsiary YTD File gn_burgershot_graphi
            ytdname = "gn_tv_screen_c", -- This will be the name of the object INSIDE the YTD File
            width = 1024, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 1024, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 3, -- This is the ID of the shop, has to be unique
            job = {["burgershot"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },
        [4] = { -- UwU Café paintings
            coords = vector3(-1196.7, -894.44, 15.47), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 1.5,
            ytd = 'gn_burgershot_graphi', -- This has to be the Dictionsiary YTD File gn_burgershot_graphi
            ytdname = "gn_tv_screen_d", -- This will be the name of the object INSIDE the YTD File
            width = 1024, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 1024, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 4, -- This is the ID of the shop, has to be unique
            job = {["burgershot"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },
    },
}

Config.Stations = {
    ["pizza"] = { -- make the [] the same as the name (otherwise the you will get an error)
        ["Pizza Oven"] = {  coords = vector3(813.79, -752.95, 27.28),   pSize = 0.9,    name = "Pizza Oven",    job = { ["pizza"] = 0},     icon = "fa-solid fa-circle",    emote = "bumbin",       headericon = "fa-solid fa-pizza-slice" },
        ["Stove Prep"] = {  coords = vector3(808.3, -760.18, 26.73),    pSize = 0.52,   name = "Stove Prep",    job = { ["pizza"] = 0 },    icon = "fa-solid fa-circle",    emote = "mechanic4",    headericon = "fa-solid fa-fire-burner" },
        ["Drinks"] = {      coords = vector3(813.54, -749.53, 27.05),   pSize = 0.52,   name = "Drinks",        job = { ["pizza"] = 0 },    icon = "fa-solid fa-circle",    emote = "mechanic4",    headericon = "fa-solid fa-bottle-droplet" },
    },


    ["burgershot"] = {
        ["Grill"] = { coords = vector3(-1198.5, -895.21, 13.82), pSize = 0.60, name = "Grill", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Frier"] = { coords = vector3(-1200.85, -896.78, 13.72), pSize = 0.70, name = "Frier", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "uncuff" },
        ["Assembly Line"] = { coords = vector3(-1196.33, -899.09, 13.82), pSize = 0.5, name = "Assembly Line", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Drinks"] = { coords = vector3(-1196.52, -894.49, 14.54), pSize = 0.5, name = "Drinks", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
    },

    ["henhouse"] = {
        ["Drinks"] = { coords = vector3(-297.4, 6263.92, 31.58), pSize = 0.60, name = "Drinks", job = { ["henhouse"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Coffee"] = { coords = vector3(-295.73, 6263.17, 31.48), pSize = 0.60, name = "Coffee", job = { ["henhouse"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Stove Prep"] = { coords = vector3(-297.74, 6271.09, 31.4), pSize = 0.60, name = "Stove Prep", job = { ["henhouse"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
    },


    ["tequilala"] = {
        ["Drinks"] = { coords = vector3(-560.91, 288.11, 82.27), pSize = 0.52, name = "Drinks", job = { ["tequilala"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Drinks2"] = { coords = vector3(-561.24, 285.4, 82.43), pSize = 0.52, name = "Drinks", job = { ["tequilala"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
    },

    ["popsdiner"] = {
        ["coffee"] = { coords = vector3(1592.29, 6456.87, 26.21), pSize = 0.52, name = "Coffee", job = { ["popsdiner"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Stove Prep"] = { coords = vector3(1587.76, 6459.22, 26.14), pSize = 0.52, name = "Stove Prep", job = { ["popsdiner"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Drinks"] = { coords = vector3(1586.13, 6459.93, 26.49), pSize = 0.52, name = "Drinks", job = { ["popsdiner"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Slushee"] = { coords = vector3(1585.3, 6460.16, 26.3), pSize = 0.52, name = "Slushee", job = { ["popsdiner"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Slushee2"] = { coords = vector3(1594.21, 6456.0, 26.3), pSize = 0.52, name = "Slushee", job = { ["popsdiner"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
    },
}

Config.Registers = {
    catcafe = {
        [1] = { coords = vector3(-584.13, -1058.69, 22.34), polysize = 0.25, icon = "fa-solid fa-circle" },
        [2] = { coords = vector3(-584.14, -1061.38, 22.34), polysize = 0.25, icon = "fa-solid fa-circle" }
    },

    pizza = {
        [1] = { coords = vector3(811.28, -751.83, 26.78), polysize = 0.25, icon = "fa-solid fa-circle" },
        [2] = { coords = vector3(811.28, -750.64, 26.78), polysize = 0.25, icon = "fa-solid fa-circle" }
    },
    henhouse = {
        [1] = { coords = vector3(-298.17, 6261.72, 31.60), polysize = 0.30, icon = "fa-solid fa-circle" }
    },
    popsdiner = {
        [1] = { coords = vector3(1589.11, 6458.2, 26.1), polysize = 0.30, icon = "fa-solid fa-circle" },
        [2] = { coords = vector3(1595.22, 6455.28, 26.12), polysize = 0.30, icon = "fa-solid fa-circle" }
    },
    burgershot = {
        [1] = { coords = vector3(-1192.98, -896.29, 14.15), polysize = 0.25, icon = "fa-solid fa-circle" },
        [2] = { coords = vector3(-1193.96, -894.67, 14.32), polysize = 0.25, icon = "fa-solid fa-circle" },
        [3] = { coords = vector3(-1194.98, -893.19, 14.03), polysize = 0.25, icon = "fa-solid fa-circle" }
    },
    tequilala = {
        [1] = { coords = vector3(-562.98, 287.51, 82.23), polysize = 0.25, icon = "fa-solid fa-circle" }
    },
}


Config.CuttingBoardCoords = {
    [1] = { coords = vector3(810.48, -765.16, 26.68), job = "pizza", polysize = 0.5, icon = "fa-solid fa-circle" },
    [2] = { coords = vector3(809.21, -761.15, 26.68), job = "pizza", polysize = 0.5, icon = "fa-solid fa-circle" },
    -- UwU Cafe
    [4]  = { coords = vector3(-591.07, -1063.04, 22.36), job = "catcafe", polysize = 0.55, icon = "fa-solid fa-circle" },

    -- burgershot
    [5]  = { coords = vector3(-1197.48, -898.29, 13.92), job = "burgershot", polysize = 0.45, icon = "fa-solid fa-circle" },

    --henhouse
    [6]  = { coords = vector3(-298.58, 6270.07, 31.5), job = "henhouse", polysize = 0.45, icon = "fa-solid fa-circle" },

    --Pops Diner
    [9] = { coords = vector3(1587.15, 6459.29, 26.16), job = "popsdiner", polysize = 0.45, icon = "fa-solid fa-circle" }
}

Config.HandWash = {
    ---- ** Pizza This ** ----
    [1] = { coords = vector3(809.47, -765.20, 26.88), polysize = 0.42, icon = "fa-solid fa-hands-bubbles" },
    [2] = { coords = vector3(809.30, -760.09, 26.88), polysize = 0.50, icon = "fa-solid fa-hands-bubbles" },
    [3] = { coords = vector3(800.81, -767.86, 26.68), polysize = 0.36, icon = "fa-solid fa-hands-bubbles" },
    [4] = { coords = vector3(800.88, -767.05, 26.78), polysize = 0.36, icon = "fa-solid fa-hands-bubbles" },
    [5] = { coords = vector3(800.81, -762.03, 26.78), polysize = 0.36, icon = "fa-solid fa-hands-bubbles" },
    [6] = { coords = vector3(800.86, -761.19, 26.78), polysize = 0.36, icon = "fa-solid fa-hands-bubbles" },


    ---- UwU Cafe ** ----
    [9] = { coords = vector3(-587.79, -1062.57, 22.31), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },

    ---- ** Burger Shot ** ----
    [10] = { coords = vector3(-1197.6, -902.76, 13.67), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
    --henhouse
    [11] = { coords = vector3(185.45, -248.21, 54.07), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
    [12] = { coords = vector3(-300.02, 6270.46, 31.1), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },

    --PopsDiner
    [15] = {coords = vector3(1596.42, 6454.42, 26.0), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
}

Config.BusinessZone = {
    [1] = {
        label = "pizza", -- this HAS to be the same name as your Config.DUI Table for each restaurants AND has to be your JOB NAME aswell
        zones = {
            vector2(815.43725585938, -769.3916015625),
            vector2(816.32427978516, -736.61773681641),
            vector2(813.86578369141, -732.19110107422),
            vector2(803.97991943359, -720.43774414062),
            vector2(799.28356933594, -717.26361083984),
            vector2(787.95263671875, -717.04296875),
            vector2(788.22003173828, -769.29443359375)
        },
        minz = 25.5,
        maxz = 35.5,
    },

    [2] = {
        label = "burgershot",
        zones = {
            vector2(-1189.3524169922, -871.67938232422),
            vector2(-1215.9440917969, -889.21130371094),
            vector2(-1198.2188720703, -914.12475585938),
            vector2(-1169.4241943359, -899.88031005859)
        },
        minz = 11,
        maxz = 19
    },

    [3] = {
        label = "henhouse",
        zones = {
            vector2(-306.78100585938, 6248.3935546875),
            vector2(-288.27365112305, 6264.498046875),
            vector2(-303.38427734375, 6280.1586914062),
            vector2(-319.02996826172, 6263.92578125)
        },
        minz = 30.444395065308,
        maxz = 38.492126464844
    },

    [4] = {
        label= "tequilala",
        zones = {
            vector2(-580.28, 271.2),
            vector2(-555.58, 268.98),
            vector2(-551.51, 269.8),
            vector2(-546.5, 272.94),
            vector2(-544.36, 277.01),
            vector2(-543.86, 279.87),
            vector2(-542.65, 297.58),
            vector2(-580.28, 301.58)
        },
        minz = 77.8,
        maxz = 92.8
    },

    [5] = {
        label= "popsdiner",
        zones = {
            vector2(1596.73, 6438.41),
            vector2(1598.54, 6438.8),
            vector2(1601.88, 6441.39),
            vector2(1603.75, 6443.72),
            vector2(1604.58, 6445.82),
            vector2(1606.92, 6458.94),
            vector2(1578.72, 6474.49),
            vector2(1568.61, 6450.25)
        },
        minz = 22.05,
        maxz = 32.72
    }
}

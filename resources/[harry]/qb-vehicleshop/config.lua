Config = {}
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.10 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(-29.53, -1103.67, 26.42)-- Where the finance menu is located
Config.PaymentWarning = 10 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 24 -- maximum payments allowed
Config.PreventFinanceSelling = false -- allow/prevent players from using /transfervehicle if financed
Config.FilterByMake = false -- adds a make list before selecting category in shops
Config.SortAlphabetically = true -- will sort make, category, and vehicle selection menus alphabetically
Config.HideCategorySelectForOne = true -- will hide the category selection menu if a shop only sells one category of vehicle or a make has only one category
Config.Shops = {
    ['pdm'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-60.782905578613, -1099.5883789063),
                vector2(-53.155605316162, -1078.3166503906),
                vector2(-25.630695343018, -1088.2370605469),
                vector2(-33.021854400635, -1108.6143798828)
            },
            ['minZ'] = 26.1, -- min height of the shop zone
            ['maxZ'] = 30.377498626709, -- max height of the shop zone
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Premium Deluxe Motorsport', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 596, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['Categories'] = {-- Categories available to browse
            ['sports'] = 'Sports',
            ['sportsclassics'] = 'Sports Classics',
            ['sedans'] = 'Sedans',
            ['coupes'] = 'Coupes',
            ['suvs'] = 'SUVs',
            ['offroad'] = 'Offroad',
            ['muscle'] = 'Muscle',
            ['compacts'] = 'Compacts',
            ['motorcycles'] = 'Motorcycles',
            ['vans'] = 'Vans',
        },
        ['TestDriveTimeLimit'] = 4.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-45.67, -1098.34, 26.42), -- Blip Location
        ['ReturnLocation'] = vector3(-44.74, -1082.58, 26.68), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-42.659832000732, -1101.4776611328, 26.295945739746, 289.04724121094), -- where the vehicle will spawn on display
                defaultVehicle = 'adder', -- Default display vehicle
                chosenVehicle = 'adder', -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-36.72338104248, -1093.0740966797, 26.296880340576, 114.45799255371),
                defaultVehicle = 'sultanrs',
                chosenVehicle = 'sultanrs'
            },
            [3] = {
                coords = vector4(-47.559753417969, -1091.8087158203, 26.296880340576, 189.43598937988),
                defaultVehicle = 'issi2',
                chosenVehicle = 'issi2'
            },
            [4] = {
                coords = vector4(-49.815711975098, -1083.9376220703, 26.296880340576, 157.86126708984),
                defaultVehicle = 'exemplar',
                chosenVehicle = 'exemplar'
            },
            [5] = {
                coords = vector4(-54.598400115967, -1096.7946777344,  26.296880340576, 302.17147827148),
                defaultVehicle = 't20',
                chosenVehicle = 't20'
            }
        },
    },
    ['luxury'] = {
        ['Type'] = 'managed', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(-2218.6799316406, -370.73742675781),
                vector2(-2194.0788574219, -395.90151977539),
                vector2(-2208.0593261719, -419.80249023438),
                vector2(-2238.4436035156, -394.30303955078)
            },
            ['minZ'] = 13.385863304138,
            ['maxZ'] = 13.385878562927,
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['ShopLabel'] = 'Luxury Vehicle Shop',
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 662, -- Blip sprite
        ['blipColor'] = 15, -- Blip color
        ['Categories'] = {
            ['sports'] = 'Sports',
            ['sportsclassics'] = 'Sports Classics',
            ['sedans'] = 'Sedans',
            ['coupes'] = 'Coupes',
            ['suvs'] = 'SUVs',
            ['offroad'] = 'Offroad',
            ['muscle'] = 'Muscle',
            ['compacts'] = 'Compacts',
            ['motorcycles'] = 'Motorcycles',
            ['vans'] = 'Vans',
        },
        ['TestDriveTimeLimit'] = 4.5,
        ['Location'] = vector3(-2214.27, -393.55, 17.47),
        ['ReturnLocation'] = vector3(-2234.17, -379.49, 13.41),
        ['VehicleSpawn'] = vector4(-2224.12, -387.93, 13.39, 48.95),
        ['TestDriveSpawn'] = vector4(-2237.51, -372.12, 13.41, 316.31), -- Spawn location for test drive vector3(-2220.661, -376.419, 13.386) --[vector4(-2220.661, -376.419, 13.386, 320.0)]--
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-2220.661, -376.419, 13.386, 320.0),
                defaultVehicle = 'fraptor',
                chosenVehicle = 'fraptor'
            },
            [2] = {
                coords = vector4(-2215.857, -380.319, 13.386, 320.0),
                defaultVehicle = 'fk2',
                chosenVehicle = 'fk2'   
            },
            [3] = {
                coords = vector4(-2204.141, -390.894, 13.386, 320.0),
                defaultVehicle = '16m5',
                chosenVehicle = '16m5'   
            },
            [4] = {
                coords = vector4(-2200.058, -394.928, 13.386, 290.0),
                defaultVehicle = 'ffrs',
                chosenVehicle = 'ffrs'   
            },
            [5] = {
                coords = vector4(-2199.884, -399.261, 13.386, 270.0),
                defaultVehicle = 'trhawk',
                chosenVehicle = 'trhawk'   
            },
            [6] = {
                coords = vector4(-2201.372, -404.199, 13.386, 255.0),
                defaultVehicle = 'rsv4',
                chosenVehicle = 'rsv4'   
            },
            [7] = {
                coords = vector4(-2205.058, -407.835, 13.386, 235.0), 
                defaultVehicle = 'rs6abt20',
                chosenVehicle = 'rs6abt20'   
            },
            [8] = {
                coords = vector4(-2208.83, -412.507, 13.386, 235.0),
                defaultVehicle = 'Revuelto',
                chosenVehicle = 'Revuelto'   
            },
        },
    }, -- Add your next table under this comma
}

Config = {}

-- if you have renamed your qb-core, es_extended, event names, make sure to change them. Based on this information your framework will be detected.
Config.FrameworkTriggers = {
    ["qb"] = {
        ResourceName = "qb-core",
        PlayerLoaded = "QBCore:Client:OnPlayerLoaded",
        PlayerUnload = "QBCore:Client:OnPlayerUnload",
        OnJobUpdate = "QBCore:Client:OnJobUpdate",
        OnGangUpdate = "QBCore:Client:OnGangUpdate",
    },
    ["esx"] = {
        ResourceName = "es_extended",
        PlayerLoaded = "esx:playerLoaded",
        PlayerUnload = "esx:playerDropped",
        OnJobUpdate = "esx:setJob",
        OnPlayerUnload = "esx:onPlayerLogout",
    }
}

Config.Notify = "qb" -- qb || ox || esx || okok

-- ONLY FOR ESX. This is set as true by default for QBCore
Config.JobAccounts = true -- If you want to use job accounts inside my banking, set this to true. This account is different from the society addon accounts and not linked to them in anyway.

-- char id for ESX and citizenid for QBCore
Config.DefaultIdentifier = "RHW07882" -- set the identifier for the player to whom the loans should be transferred when a player who has given out loans deletes their character


Config.Options = "target" -- target || drawtext (if draw text, it will show draw text ui using lib or if you select target, it will be target based. Code is open in client/open/cl_locations.lua)
Config.BankConfig = "default" -- gabz || default (If you use some other banks, make sure to create a file in locations folder and put the file name here!!)
Blips = {
    unique_blips = false, -- this will create each blip which will show individually in the side bar. If you see flashing side bar due to the high number of blips, set this to false.
    blip_scale = 0.8,
    blip_sprite = 108,
    generic_blip_label = "Bank", -- only shows if you set unique_blips to false
    generic_blip_color = 2 -- only shows if you set unique_blips to false
}

Config.ATMModels = {
    `prop_atm_01`,
    `prop_atm_02`,
    `prop_atm_03`,
    `prop_fleeca_atm`
}


Config.AllowLoans = true -- Do you want evenyone to see the loans tab in the bank.

Config.AnyOneCanCreateLoans = false -- set to true if you want any to create loans, if you set this to false, make sure to change the job names in Config.LoanJobs
Config.LoanJobs = { -- job with grade. If you want to add more jobs, just add the job name and grade. For example, ["police"] = 0, ["judge"] = 0. Anyone with grade mentioned and above can create loans. This logic can be changed in cl_loans_customise
    ["tuner"] = 0,
}

-- this is the place from which only the manage UI will open. So for example, you can put this in the police station or cityhall from where police/judges can freeze/flag accounts.
Config.ManagementLocations = {
    vector3(441.16, -978.85, 30.69)
}

Config.SupervisorJobs = { -- jobs that can manage the accounts like freeze/manage/export transactions for anyone
    ["police"] = 4,
    ["bankmanager"] = 1,2,
}

Config.Dispatch = "ps" -- cd || ps || moz || other (if you select other, you will have to add your own dispatch alert from the function SendPoliceAlertForFlaggedAccount() in client/open/cl_customise.lua)



-- DO NOT TOUCH THIS!!!!

for k, v in pairs(Config.FrameworkTriggers) do
    if GetResourceState(v.ResourceName) == "started" then
        Config.Framework = k
        break
    end
end

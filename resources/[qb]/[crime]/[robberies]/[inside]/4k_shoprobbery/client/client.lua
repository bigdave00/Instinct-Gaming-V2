local QBCore = exports['qb-core']:GetCoreObject()

--------------------------------------------------------------------------------
local PlayerData = {}
local started, blockstart, pedwaling, CashRegister, restart, firstlock, secondlock = false, false, false, false, false, false, false
local PoliceAmount, cassettedone, TimeDefault = 0, 0, 0

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function()
	PlayerData.job = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('inside-shoprobbery:playerdropped')
AddEventHandler('inside-shoprobbery:playerdropped', function()
    if started then
		TriggerServerEvent('inside-shoprobbery:playerdroppedStop')
	end
end)

RegisterNetEvent('inside-shoprobbery:playerdroppedStopC')
AddEventHandler('inside-shoprobbery:playerdroppedStopC', function()
	blockstart = false
end)

RegisterNetEvent('inside-shoprobbery:Csomeonestart')
AddEventHandler('inside-shoprobbery:Csomeonestart', function(type)
	if type then
		blockstart = true
	else
		blockstart = false
	end
end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    PoliceAmount = amount
end)

function IsPedNotDoingAnything(ped)
    if IsPedOnFoot(ped) and not IsEntityInWater(ped) then
        if not IsPedSprinting(ped) and not IsPedRunning(ped) and not IsPedWalking(ped) then
            if not GetIsTaskActive(ped, 12) and not GetIsTaskActive(ped, 307) then
                if IsPedStill(ped) then
                    return true
                else return false end
            else return false end
        else return false end
    else return false end
end

Citizen.CreateThread(function ()
	while true do
	if pedwalking then 
		if IsPedNotDoingAnything(CodeNPC) then
			TaskWanderInArea(CodeNPC, Config.shoprobbery['CodeNPC'].Pos.x, Config.shoprobbery['CodeNPC'].Pos.y, Config.shoprobbery['CodeNPC'].Pos.z, 50.0)	
		end
	end
	Citizen.Wait(500)
	end
end)

Citizen.CreateThread(function()
	local ped_hash = GetHashKey(Config.shoprobbery['BossSpawn'].Type)
	RequestModel(ped_hash)
	while not HasModelLoaded(ped_hash) do
		Citizen.Wait(1)
	end	
	BossNPC = CreatePed(1, ped_hash, Config.shoprobbery['BossSpawn'].Pos.x, Config.shoprobbery['BossSpawn'].Pos.y, Config.shoprobbery['BossSpawn'].Pos.z-1, Config.shoprobbery['BossSpawn'].Pos.h, false, true)
	SetBlockingOfNonTemporaryEvents(BossNPC, true)
	SetPedDiesWhenInjured(BossNPC, false)
	SetPedCanPlayAmbientAnims(BossNPC, true)
	SetPedCanRagdollFromPlayerImpact(BossNPC, false)
	SetEntityInvincible(BossNPC, true)
	FreezeEntityPosition(BossNPC, true)
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		if not blockstart then
			if(GetDistanceBetweenCoords(coords,Config.shoprobbery['BossSpawn'].Pos.x, Config.shoprobbery['BossSpawn'].Pos.y, Config.shoprobbery['BossSpawn'].Pos.z, true) < 9.0) and not started then	
				sleep = 5
				if(GetDistanceBetweenCoords(coords,Config.shoprobbery['BossSpawn'].Pos.x, Config.shoprobbery['BossSpawn'].Pos.y, Config.shoprobbery['BossSpawn'].Pos.z, true) < 1.5) then	
					DrawMarker(25, Config.shoprobbery['BossSpawn'].Pos.x, Config.shoprobbery['BossSpawn'].Pos.y, Config.shoprobbery['BossSpawn'].Pos.z-1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 69, 255, 66, 100, false, true, 2, false, false, false, false)
					DrawText3Ds(Config.shoprobbery['BossSpawn'].Pos.x, Config.shoprobbery['BossSpawn'].Pos.y, Config.shoprobbery['BossSpawn'].Pos.z+1.0, 'To plan the robbery, press [~g~E~w~]')
					if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then

							if PoliceAmount >= Config.Police then


								QBCore.Functions.TriggerCallback('inside-shoprobbery:SecBetwNextRob', function(YouCan)	
									if YouCan then
										--exports.pNotify:SendNotification({text = "<b>Shop Robbery</b></br>Collect information on the amount of money in stores from the menager", timeout = 4000})
										QBCore.Functions.Notify("You need to know how much money is in the store, from the store manager!", "success")
										TriggerServerEvent('inside-shoprobbery:Ssomeonestart', true)
										started = true

										pedwalking = true
										local ped_hash = GetHashKey(Config.shoprobbery['CodeNPC'].Type)
										RequestModel(ped_hash)
										while not HasModelLoaded(ped_hash) do
											Citizen.Wait(1)
										end	
										CodeNPC = CreatePed(1, ped_hash, Config.shoprobbery['CodeNPC'].Pos.x, Config.shoprobbery['CodeNPC'].Pos.y, Config.shoprobbery['CodeNPC'].Pos.z, Config.shoprobbery['CodeNPC'].Pos.h, false, true)
										if IsPedNotDoingAnything(CodeNPC) then
											ClearPedTasks(CodeNPC)
											
												SetPedIsDrunk(CodeNPC, true)
												RequestAnimSet("move_m@drunk@verydrunk")
												while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
													Wait(1)
												end
												SetPedMovementClipset(CodeNPC, "move_m@drunk@verydrunk", 1.0)
											
											TaskWanderInArea(CodeNPC, Config.shoprobbery['CodeNPC'].Pos.x, Config.shoprobbery['CodeNPC'].Pos.y, Config.shoprobbery['CodeNPC'].Pos.z, 50.0)	
										end
										BlipCodeNPC = AddBlipForEntity(CodeNPC)
										SetBlipDisplay(BlipCodeNPC, 4)
										SetBlipScale  (BlipCodeNPC, 0.8)
										SetBlipColour (BlipCodeNPC, 0)
										SetBlipAsShortRange(BlipCodeNPC, true)
										BeginTextCommandSetBlipName("STRING")
										AddTextComponentString('Manager')
										EndTextCommandSetBlipName(BlipCodeNPC)
										SetBlipRoute(BlipCodeNPC, true)
									else
										--exports.pNotify:SendNotification({text = "<b>Shop Robbery</b></br>Someone recently did my assignment wait a while", timeout = 4000})
										QBCore.Functions.Notify("Someone has already robbed this store, wait another 5 minutes!", "error")
									end
								end)

							else
								--exports.pNotify:SendNotification({text = "<b>Shop Robbery</b></br>There are not enough police in the city", timeout = 4000})
								QBCore.Functions.Notify("I'm sorry, there aren't enough law enforcement (police) in town!", "error")

							end

					end
				else
					DrawMarker(25, Config.shoprobbery['BossSpawn'].Pos.x, Config.shoprobbery['BossSpawn'].Pos.y, Config.shoprobbery['BossSpawn'].Pos.z-1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
				end
			end
		else
			if(GetDistanceBetweenCoords(coords,Config.shoprobbery['BossSpawn'].Pos.x, Config.shoprobbery['BossSpawn'].Pos.y, Config.shoprobbery['BossSpawn'].Pos.z, true) < 9.0) then	
				sleep = 5
				if(GetDistanceBetweenCoords(coords,Config.shoprobbery['BossSpawn'].Pos.x, Config.shoprobbery['BossSpawn'].Pos.y, Config.shoprobbery['BossSpawn'].Pos.z, true) < 1.5) then	
					DrawMarker(25, Config.shoprobbery['BossSpawn'].Pos.x, Config.shoprobbery['BossSpawn'].Pos.y, Config.shoprobbery['BossSpawn'].Pos.z-1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 0, 50, false, true, 2, false, false, false, false)
					if started then
						DrawText3Ds(Config.shoprobbery['BossSpawn'].Pos.x, Config.shoprobbery['BossSpawn'].Pos.y, Config.shoprobbery['BossSpawn'].Pos.z+1.0, 'To cancel the robbery, press [~r~E~w~]')
						if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
							DeletePed(CodeNPC)
							TriggerServerEvent('inside-shoprobbery:Ssomeonestart', false)
							started = false
							pedwalking = false
							firstlock = false
							secondlock = false
						end
					else
						DrawText3Ds(Config.shoprobbery['BossSpawn'].Pos.x, Config.shoprobbery['BossSpawn'].Pos.y, Config.shoprobbery['BossSpawn'].Pos.z+1.0, 'Im in a discussion with someone, come back later!')		
					end			
				else
					DrawMarker(25, Config.shoprobbery['BossSpawn'].Pos.x, Config.shoprobbery['BossSpawn'].Pos.y, Config.shoprobbery['BossSpawn'].Pos.z-1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 0, 100, false, true, 2, false, false, false, false)
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	while true do
		if started then
			Citizen.Wait(Config.TimeToEnd)
			if started and not CashRegister then
				--exports.pNotify:SendNotification({text = "<b>Shop Robbery</b></br>Time to complete the task has passed", timeout = 4000})
				QBCore.Functions.Notify("The time required for the robbery has expired, good luck next time!", "error")
				DeletePed(CodeNPC)
				pedwalking = false
				RemoveBlip(ShopBlip)
				DeletePed(ShopNPC)
				started = false
				TriggerServerEvent('inside-shoprobbery:playerdroppedStop')
			end 
		end
		Citizen.Wait(500)
	end
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		if started then
			NPCcoords = GetEntityCoords(CodeNPC)
			if(GetDistanceBetweenCoords(coords,NPCcoords.x, NPCcoords.y, NPCcoords.z, true) < 1.5) then	
				sleep = 5
				DrawText3Ds(NPCcoords.x, NPCcoords.y, NPCcoords.z+1.0, 'To steal the document, press [~r~E~w~]')
				if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
					pedwalking = false
					ClearPedTasks(CodeNPC)
					TaskTurnPedToFaceEntity(CodeNPC, PlayerPedId(), 0.2)
					FreezeEntityPosition(CodeNPC, true)	
					startAnim(ped, "anim@gangops@facility@servers@bodysearch@", "player_search")
					exports.rprogress:Custom({
						Duration = 3000,
						Label = "Stealing the documents..",
						Animation = {
							scenario = "", -- https://pastebin.com/6mrYTdQv
							animationDictionary = "", -- https://alexguirre.github.io/animations-list/
						},
						DisableControls = {
							Mouse = false,
							Player = true,
							Vehicle = true
						}
					})
					Citizen.Wait(3000)
					RemoveBlip(BlipCodeNPC)
					FreezeEntityPosition(CodeNPC, false)
					ClearPedTasks(ped)
					ClearPedTasks(CodeNPC)
					TaskGoToCoordAnyMeans(CodeNPC, NPCcoords.x, NPCcoords.y+50, NPCcoords.z, 2.0)


				
					Shop = Randomize(Config.Randomize)
					--exports.pNotify:SendNotification({text = "<b>Shop Robbery</b></br>Got it go on "..Shop.name, timeout = 4000})
					QBCore.Functions.Notify("You stole the documents, you can go to the store on the street " ..Shop.name.. ".", "success")
					ShopRobbery()
				end
			end
		end	
	Citizen.Wait(sleep)
	end
end)

RegisterNetEvent('inside-shoprobbery:PoliceNotifyC')
AddEventHandler('inside-shoprobbery:PoliceNotifyC', function(coords)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		street = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
		street2 = GetStreetNameFromHashKey(street)
		--exports.pNotify:SendNotification({text = "<b>Shop Robbery</b></br>Someone took out a gun in the store <b>" ..street2.. "</b>.", timeout = 7500})
		QBCore.Functions.Notify("Possible armed robbery at a store on the street " ..street2.. ". Ask for reinforcements and be careful!", "success")

		blipcops = AddBlipForCoord(coords.x, coords.y, coords.z)
		SetBlipSprite(blipcops, 161)
		SetBlipColour(blipcops,  1)
		SetBlipAlpha(blipcops, 250)
		SetBlipScale(blipcops, 1.2)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Robbing the store')
		EndTextCommandSetBlipName(blipcops)
        Wait(60000)
        RemoveBlip(blipcops)
	end
end)

function ShopRobbery()
	ShopBlip = AddBlipForCoord(Config.Shops[Shop.name].ShopPos.x, Config.Shops[Shop.name].ShopPos.y, Config.Shops[Shop.name].ShopPos.z)	
	SetBlipSprite (ShopBlip, 156)
	SetBlipDisplay(ShopBlip, 4)
	SetBlipScale  (ShopBlip, 1.0)
	SetBlipColour (ShopBlip, 0)
	SetBlipAsShortRange(ShopBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Armed Robbery')
	EndTextCommandSetBlipName(ShopBlip)	
	SetBlipRoute(ShopBlip, true)

	local ped_hash = GetHashKey(Config.Shops[Shop.name].Type)
	RequestModel(ped_hash)
	while not HasModelLoaded(ped_hash) do
		Citizen.Wait(1)
	end	
	ShopNPC = CreatePed(1, ped_hash, Config.Shops[Shop.name].PedPos.x, Config.Shops[Shop.name].PedPos.y, Config.Shops[Shop.name].PedPos.z-1, Config.Shops[Shop.name].PedPos.h, false, true)	
	SetPedDiesWhenInjured(ShopNPC, false)
	SetPedCanPlayAmbientAnims(ShopNPC, true)
	SetPedCanRagdollFromPlayerImpact(ShopNPC, false)
	SetEntityInvincible(ShopNPC, true)
	FreezeEntityPosition(ShopNPC, true)
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
			if(GetDistanceBetweenCoords(coords, Config.Shops[Shop.name].PedPos.x, Config.Shops[Shop.name].PedPos.y, Config.Shops[Shop.name].PedPos.z, true) < 6.5) then	
				sleep = 5
				FreezeEntityPosition(ShopNPC, false)
				DrawText3Ds(Config.Shops[Shop.name].PedPos.x, Config.Shops[Shop.name].PedPos.y, Config.Shops[Shop.name].PedPos.z+1.0, 'Greetings, how can I help you?')
				if IsPlayerFreeAiming(PlayerId()) then
					local aiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId())
					if IsPedFleeing(targetPed) and targetPed == ShopNPC then						
						CashRegister = true
						SetBlockingOfNonTemporaryEvents(ShopNPC, true)
						startAnim(ShopNPC, 'anim@mp_player_intuppersurrender', 'enter')
						local displaying = true
						TaskGoToCoordAnyMeans(ShopNPC, Config.Shops[Shop.name].PedWalks.x, Config.Shops[Shop.name].PedWalks.y, Config.Shops[Shop.name].PedWalks.z, 1.5)

						--TriggerServerEvent('inside-shoprobbery:PoliceNotify', coords)
						
						local pos = GetEntityCoords(PlayerPedId())

						local DispatchData = {
							jobs = {["police"] = true},
							code = "10-04",
							callname = "Shop Robbery",
							coords = pos,
							info = {{
								icon = "fas fa-shopping-basket",
								label = "A man reported about a shop robbery!"
							}},
							blip = { -- All the blip settings.
								label = "10-04", -- Blip label.
								sprite = 42, -- Blip sprties and colours can by found here: https://docs.fivem.net/docs/game-references/blips/
								colour = 0,
								scale = 1.0,
								flash = true,
								fadeTime = 250, -- about of time for the blip to fade away.
								leaveMiniMap = false -- sets if the blips stay on the mini map or not even if not close to the blip location.
							},
							sound = sound,
						}
						exports['qs-dispatch']:StoreRobbery()


						TriggerServerEvent('inside-shoprobbery:RobberyTimeStart')
						Citizen.CreateThread(function()
							Wait(3000)
							displaying = false
						end)
						while displaying do
							Wait(0)
							if restart then break end
							local coordsPed = GetEntityCoords(ShopNPC, false)             
							DrawText3Ds(coordsPed['x'], coordsPed['y'], coordsPed['z'] + 1.2, "Okay, okay, the safe is already open..")
						end
						atlocation = false
						Citizen.CreateThread(function()
							Wait(10000)
							if atlocation then								
								SetEntityCoords(ShopNPC, Config.Shops[Shop.name].PedWalks.x, Config.Shops[Shop.name].PedWalks.y, Config.Shops[Shop.name].PedWalks.z-1)
								SetEntityHeading(ShopNPC, Config.Shops[Shop.name].PedWalks.h)
							end
						end)
						while true do
							local coords2 = GetEntityCoords(ShopNPC)
							if(GetDistanceBetweenCoords(coords2,  Config.Shops[Shop.name].PedWalks.x, Config.Shops[Shop.name].PedWalks.y, Config.Shops[Shop.name].PedWalks.z, true) < 1.5) then
								atlocation = true
								SetEntityCoords(ShopNPC, Config.Shops[Shop.name].PedWalks.x, Config.Shops[Shop.name].PedWalks.y, Config.Shops[Shop.name].PedWalks.z-1)
								SetEntityHeading(ShopNPC, Config.Shops[Shop.name].PedWalks.h)
								break
							end	
							Citizen.Wait(5)
						end
						

						--startAnim(ShopNPC, 'anim@mp_player_intuppersurrender', 'enter')
						ClearPedTasks(ShopNPC)
						FreezeEntityPosition(ShopNPC, true)
						startAnim(ShopNPC, 'amb@prop_human_bum_bin@idle_a', 'idle_a')

						TimeDefault = Config.Shops[Shop.name].Time

						Citizen.CreateThread(function()
							Config.Shops[Shop.name].Time = Config.Shops[Shop.name].Time + 1
							while true do
								if restart then break end
								Config.Shops[Shop.name].Time = Config.Shops[Shop.name].Time - 1
								Citizen.Wait(1000)
								if Config.Shops[Shop.name].Time <= 0 then
									--exports.pNotify:SendNotification({text = "<b>Shop Robbery</b></br>Cash ready to be picked up", timeout = 4500})
									QBCore.Functions.Notify("Look, money is ready ... you can take it ", "success")
									
									ClearPedTasks(ShopNPC)
									local coordsPED = GetEntityCoords(ShopNPC)
									startAnim(ShopNPC, 'anim@heists@box_carry@', 'idle')
									pack = CreateObject(GetHashKey('prop_cash_case_02'), coordsPED.x, coordsPED.y, coordsPED.z,  true,  true, true)
									AttachEntityToEntity(pack, ShopNPC, GetPedBoneIndex(ShopNPC, 57005), 0.20, 0.05, -0.25, 260.0, 60.0, 0, true, true, false, true, 1, true)
									break
								end							
							end
						end)

						while true do
							local ped = PlayerPedId()
							local coords = GetEntityCoords(ped)
							if Config.Shops[Shop.name].Time > 0 then
								if(GetDistanceBetweenCoords(coords, Config.Shops[Shop.name].PedWalks.x, Config.Shops[Shop.name].PedWalks.y, Config.Shops[Shop.name].PedWalks.z, true) < 3.5) then
									DrawText3Ds(Config.Shops[Shop.name].PedWalks.x, Config.Shops[Shop.name].PedWalks.y, Config.Shops[Shop.name].PedWalks.z+1.0, 'Remaining time: '..tostring(Config.Shops[Shop.name].Time))
								end
								--DrawText2Ds(0.19, 0.95, 'Time: '..tostring(Config.Shops[Shop.name].Time), 0.6)
								if restart then break end
							else
								if(GetDistanceBetweenCoords(coords, Config.Shops[Shop.name].PedWalks.x, Config.Shops[Shop.name].PedWalks.y, Config.Shops[Shop.name].PedWalks.z, true) < 1.5) then	
									DrawText3Ds(Config.Shops[Shop.name].PedWalks.x, Config.Shops[Shop.name].PedWalks.y, Config.Shops[Shop.name].PedWalks.z + 1, "To get the money, press [~r~E~w~]")
									if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped, false) then
										FreezeEntityPosition(ShopNPC, false)
										TaskTurnPedToFaceEntity(ShopNPC, PlayerPedId(), 0.2)
										startAnim(ped, "anim@gangops@facility@servers@bodysearch@", "player_search")
										exports.rprogress:Custom({
											Duration = 6500,
											Label = "Taking the cash..",
											Animation = {
												scenario = "", -- https://pastebin.com/6mrYTdQv
												animationDictionary = "", -- https://alexguirre.github.io/animations-list/
											},
											DisableControls = {
												Mouse = false,
												Player = true,
												Vehicle = true
											}
										})
										Citizen.Wait(6500)
										ClearPedTasks(ShopNPC)
										TaskPlayAnim(ShopNPC, 'anim@heists@box_carry@', "exit", 3.0, 1.0, -1, 49, 0, 0, 0, 0)
										DeleteEntity(pack)	
										QBCore.Functions.TriggerCallback('inside-shoprobbery:payout', function(money)
											--exports.pNotify:SendNotification({text = "<b>Shop Robbery</b></br>You took "..money.."$", timeout = 4500})
											QBCore.Functions.Notify("You stole the amount of " ..money.. "$, it's time to run!", "success")
										end, Config.Shops[Shop.name].Money)	
										break
									end
								end
							end								
							Citizen.Wait(5)
						end
						Citizen.Wait(5000)
						RemoveBlip(ShopBlip)
						DeletePed(ShopNPC)
						started = false
						TriggerServerEvent('inside-shoprobbery:playerdroppedStop')
						Config.Shops[Shop.name].Time = TimeDefault
						break
					end
				end
			end
		Citizen.Wait(sleep)
	end
end

Citizen.CreateThread(function()
    while true do
    local sleep = 5000
		if CashRegister then
			sleep = 5
			local ped2 = PlayerPedId()
			local coords = GetEntityCoords(ped2)
			if Config.Shops[Shop.name].CashRegister1 then 
				if(GetDistanceBetweenCoords(coords, Config.Shops[Shop.name].CashRegister1.x, Config.Shops[Shop.name].CashRegister1.y, Config.Shops[Shop.name].CashRegister1.z, true) < 1.5) and not Config.Shops[Shop.name].CashRegister1.robbed then	
					DrawMarker(25, Config.Shops[Shop.name].CashRegister1.x, Config.Shops[Shop.name].CashRegister1.y, Config.Shops[Shop.name].CashRegister1.z-1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 69, 255, 66, 100, false, true, 2, false, false, false, false)
					DrawText3Ds(Config.Shops[Shop.name].CashRegister1.x, Config.Shops[Shop.name].CashRegister1.y, Config.Shops[Shop.name].CashRegister1.z, 'Press [~g~E~w~] to take the money')
					if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped2, false) then
						SetEntityCoords(ped2, Config.Shops[Shop.name].CashRegister1.x, Config.Shops[Shop.name].CashRegister1.y, Config.Shops[Shop.name].CashRegister1.z-1)
						SetEntityHeading(ped2, Config.Shops[Shop.name].CashRegister1.h)
						startAnim(ped2, "anim@gangops@facility@servers@bodysearch@", "player_search")
						exports.rprogress:Custom({
							Duration = 4500,
							Label = "Taking money from cash register..",
							Animation = {
								scenario = "", -- https://pastebin.com/6mrYTdQv
								animationDictionary = "", -- https://alexguirre.github.io/animations-list/
							},
							DisableControls = {
								Mouse = false,
								Player = true,
								Vehicle = true
							}
						})
						Citizen.Wait(4500)
						Config.Shops[Shop.name].CashRegister1.robbed = true
						QBCore.Functions.TriggerCallback('inside-shoprobbery:cassettepayout', function(money)
							--exports.pNotify:SendNotification({text = "<b>Shop Robbery</b></br>You took "..money.."$", timeout = 4500})
							QBCore.Functions.Notify("You stole the amount of " ..money.. "$, not bad!", "success")
						end)
					end
				end
			end
			if Config.Shops[Shop.name].CashRegister2 then
				if(GetDistanceBetweenCoords(coords, Config.Shops[Shop.name].CashRegister2.x, Config.Shops[Shop.name].CashRegister2.y, Config.Shops[Shop.name].CashRegister2.z, true) < 1.5) and not Config.Shops[Shop.name].CashRegister2.robbed then
				DrawMarker(25, Config.Shops[Shop.name].CashRegister2.x, Config.Shops[Shop.name].CashRegister2.y, Config.Shops[Shop.name].CashRegister2.z-1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 69, 255, 66, 100, false, true, 2, false, false, false, false)
				DrawText3Ds(Config.Shops[Shop.name].CashRegister2.x, Config.Shops[Shop.name].CashRegister2.y, Config.Shops[Shop.name].CashRegister2.z, 'Press [~g~E~w~] to take the money')			
					if IsControlJustReleased(0, Keys['E']) and not IsPedInAnyVehicle(ped2, false) then
						SetEntityCoords(ped2, Config.Shops[Shop.name].CashRegister2.x, Config.Shops[Shop.name].CashRegister2.y, Config.Shops[Shop.name].CashRegister2.z-1)
						SetEntityHeading(ped2, Config.Shops[Shop.name].CashRegister2.h)
						startAnim(ped2, "anim@gangops@facility@servers@bodysearch@", "player_search")
						exports.rprogress:Custom({
							Duration = 3000,
							Label = "Taking money from cash register...",
							Animation = {
								scenario = "", -- https://pastebin.com/6mrYTdQv
								animationDictionary = "", -- https://alexguirre.github.io/animations-list/
							},
							DisableControls = {
								Mouse = false,
								Player = true,
								Vehicle = true
							}
						})
						Citizen.Wait(3000)
						Config.Shops[Shop.name].CashRegister2.robbed = true
						QBCore.Functions.TriggerCallback('inside-shoprobbery:cassettepayout', function(money)
							--exports.pNotify:SendNotification({text = "<b>Shop Robbery</b></br>You took "..money.."$", timeout = 4500})
							QBCore.Functions.Notify("You stole the amount of " ..money.. "$, is not bad at all!", "success")
						end)
					end
				end
			end

				
				if Config.Shops[Shop.name].CashRegister1 and not firstlock then
					if Config.Shops[Shop.name].CashRegister1.robbed then
						cassettedone = cassettedone + 1
						firstlock = true
					end
				elseif not Config.Shops[Shop.name].CashRegister1 and not firstlock then
					cassettedone = cassettedone + 1
					firstlock = true
				end
				if Config.Shops[Shop.name].CashRegister2 and not secondlock then
					if Config.Shops[Shop.name].CashRegister2.robbed then
						cassettedone = cassettedone + 1
						secondlock = true
					end
				elseif not Config.Shops[Shop.name].CashRegister2 and not secondlock then
					cassettedone = cassettedone + 1
					secondlock = true
				end


			if cassettedone >= 2 and not started then
				CashRegister = false
				if Config.Shops[Shop.name].CashRegister1 then
					Config.Shops[Shop.name].CashRegister1.robbed = false
				end
				if Config.Shops[Shop.name].CashRegister2 then
					Config.Shops[Shop.name].CashRegister2.robbed = false
				end
				cassettedone = 0
				firstlock = false
				secondlock = false
			end

			if(GetDistanceBetweenCoords(coords, Config.Shops[Shop.name].ShopPos.x, Config.Shops[Shop.name].ShopPos.y, Config.Shops[Shop.name].ShopPos.z, true) > 15.0) and (started or cassettedone < 2) then
				restart = true
				Config.Shops[Shop.name].Time = TimeDefault
				CashRegister = false
				TriggerServerEvent('inside-shoprobbery:playerdroppedStop')
				--exports.pNotify:SendNotification({text = "<b>Shop Robbery</b></br>You've run too far", timeout = 4500})
				QBCore.Functions.Notify("You've gone too far..", "error")
				RemoveBlip(ShopBlip)
				DeletePed(ShopNPC)
				if Config.Shops[Shop.name].CashRegister1 then
					Config.Shops[Shop.name].CashRegister1.robbed = false
				end
				if Config.Shops[Shop.name].CashRegister2 then
					Config.Shops[Shop.name].CashRegister2.robbed = false
				end
				cassettedone = 0
				firstlock = false
				secondlock = false
				started = false
				Citizen.Wait(5000)
				restart = false
			end
		end
    Citizen.Wait(sleep)
    end
end)

function DrawText2Ds(x, y, text, scale)
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0.0, 0.0, 0.0, 0.0, 255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function Randomize(tb)
	local keys = {}
	for k in pairs(tb) do table.insert(keys, k) end
	return tb[keys[math.random(#keys)]]
end

function startAnim(ped, dictionary, anim)
	Citizen.CreateThread(function()
	  RequestAnimDict(dictionary)
	  while not HasAnimDictLoaded(dictionary) do
		Citizen.Wait(0)
	  end
		TaskPlayAnim(ped, dictionary, anim ,8.0, -8.0, -1, 50, 0, false, false, false)
	end)
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

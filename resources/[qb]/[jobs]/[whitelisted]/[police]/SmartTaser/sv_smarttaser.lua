local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L1_1 = main
L1_1 = L1_1.framework
L1_1 = L1_1.QBCore
if L1_1 then
  L1_1 = Citizen
  L1_1 = L1_1.CreateThread
  function L2_1()
    local L0_2, L1_2, L2_2
    L0_2 = Wait
    L1_2 = 3000
    L0_2(L1_2)
    L0_2 = QBCore
    L0_2 = L0_2.Functions
    L0_2 = L0_2.CreateUseableItem
    L1_2 = main
    L1_2 = L1_2.framework
    L1_2 = L1_2.cartridgeItemName
    function L2_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3, L5_3
      L2_3 = A0_3
      L3_3 = TriggerEvent
      L4_3 = "TaserFramework:ReloadTaser"
      L5_3 = L2_3
      L3_3(L4_3, L5_3)
    end
    L0_2(L1_2, L2_2)
  end
  L1_1(L2_1)
end
L1_1 = main
L1_1 = L1_1.framework
L1_1 = L1_1.ESX
if L1_1 then
  L1_1 = Citizen
  L1_1 = L1_1.CreateThread
  function L2_1()
    local L0_2, L1_2, L2_2
    L0_2 = Wait
    L1_2 = 3000
    L0_2(L1_2)
    L0_2 = ESX
    L0_2 = L0_2.RegisterUsableItem
    L1_2 = main
    L1_2 = L1_2.framework
    L1_2 = L1_2.cartridgeItemName
    function L2_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3, L5_3
      L2_3 = A0_3
      L3_3 = TriggerEvent
      L4_3 = "TaserFramework:ReloadTaser"
      L5_3 = L2_3
      L3_3(L4_3, L5_3)
    end
    L0_2(L1_2, L2_2)
  end
  L1_1(L2_1)
end
L1_1 = RegisterNetEvent
L2_1 = "TaserFramework:addCartridge"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "TaserFramework:addCartridge"
function L3_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L5_2 = source
  L6_2 = math
  L6_2 = L6_2.random
  L7_2 = 1000
  L8_2 = 9999
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L0_1
  L8_2 = {}
  L8_2.cartridge = A1_2
  L8_2.cartridgeID = L6_2
  L8_2.shooter = L5_2
  L8_2.player = A2_2
  L7_2[A0_2] = L8_2
  if "left" == A1_2 then
    L7_2 = logToDiscord
    L8_2 = main
    L8_2 = L8_2.translations
    L8_2 = L8_2.eventType1
    L9_2 = A3_2
    L10_2 = L5_2
    L11_2 = A4_2
    L12_2 = L6_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  else
    L7_2 = logToDiscord
    L8_2 = main
    L8_2 = L8_2.translations
    L8_2 = L8_2.eventType2
    L9_2 = A3_2
    L10_2 = L5_2
    L11_2 = A4_2
    L12_2 = L6_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  if A2_2 then
    L7_2 = TriggerClientEvent
    L8_2 = "TaserFramework:SendShooter"
    L9_2 = A0_2
    L10_2 = L5_2
    L11_2 = true
    L7_2(L8_2, L9_2, L10_2, L11_2)
  else
    L7_2 = TriggerClientEvent
    L8_2 = "TaserFramework:SendShooter"
    L9_2 = L5_2
    L10_2 = A0_2
    L11_2 = false
    L7_2(L8_2, L9_2, L10_2, L11_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "TaserFramework:RemoveShooterBarbs"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "TaserFramework:RemoveShooterBarbs"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = source
  L3_2 = pairs
  L4_2 = L0_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.shooter
    if L9_2 == L2_2 and L7_2 == A0_2 then
      L9_2 = L0_1
      L9_2[L7_2] = nil
      L9_2 = TriggerClientEvent
      L10_2 = "TaserFramework:GiveNotification"
      L11_2 = L2_2
      L12_2 = main
      L12_2 = L12_2.translations
      L12_2 = L12_2.barbsRemovedByOfficer
      L13_2 = nil
      L14_2 = true
      L15_2 = nil
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
      if A1_2 then
        L9_2 = TriggerClientEvent
        L10_2 = "TaserFramework:GiveNotification"
        L11_2 = A0_2
        L12_2 = main
        L12_2 = L12_2.translations
        L12_2 = L12_2.barbsRemovedByOfficer2
        L13_2 = nil
        L14_2 = true
        L15_2 = nil
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
      end
      return
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "TaserFramework:playAudio"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "TaserFramework:playAudio"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = source
  L3_2 = TriggerClientEvent
  L4_2 = "TaserFramework:playAudioClient"
  L5_2 = -1
  L6_2 = A0_2
  L7_2 = A1_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "TaserFramework:TaseEntity"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "TaserFramework:TaseEntity"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = source
  L4_2 = pairs
  L5_2 = L0_1
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = tonumber
    L11_2 = L9_2.shooter
    L10_2 = L10_2(L11_2)
    L11_2 = tonumber
    L12_2 = L3_2
    L11_2 = L11_2(L12_2)
    if L10_2 == L11_2 then
      L10_2 = L9_2.cartridge
      if L10_2 == A1_2 then
        L10_2 = L9_2.player
        if L10_2 then
          L10_2 = logToDiscord
          L11_2 = main
          L11_2 = L11_2.translations
          L11_2 = L11_2.eventType4
          L12_2 = A0_2
          L13_2 = L3_2
          L14_2 = A2_2
          L15_2 = L9_2.cartridgeID
          L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
          L10_2 = TriggerClientEvent
          L11_2 = "TaserFramework:ClientTaseEntity"
          L12_2 = L3_2
          L13_2 = L8_2
          L14_2 = true
          L15_2 = A1_2
          L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
        else
          L10_2 = TriggerClientEvent
          L11_2 = "TaserFramework:ClientTaseEntity"
          L12_2 = L3_2
          L13_2 = L8_2
          L14_2 = false
          L15_2 = A1_2
          L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
          L10_2 = logToDiscord
          L11_2 = main
          L11_2 = L11_2.translations
          L11_2 = L11_2.eventType4
          L12_2 = A0_2
          L13_2 = L3_2
          L14_2 = A2_2
          L15_2 = L9_2.cartridgeID
          L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "TaserFramework:MissedShot"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "TaserFramework:MissedShot"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = source
  if "left" == A1_2 then
    L4_2 = logToDiscord
    L5_2 = main
    L5_2 = L5_2.translations
    L5_2 = L5_2.eventType1
    L6_2 = A0_2
    L7_2 = L3_2
    L8_2 = A2_2
    L4_2(L5_2, L6_2, L7_2, L8_2)
  else
    L4_2 = logToDiscord
    L5_2 = main
    L5_2 = L5_2.translations
    L5_2 = L5_2.eventType2
    L6_2 = A0_2
    L7_2 = L3_2
    L8_2 = A2_2
    L4_2(L5_2, L6_2, L7_2, L8_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "TaserFramework:ServerActivateBarbs"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "TaserFramework:ServerActivateBarbs"
function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = source
  L5_2 = TriggerClientEvent
  L6_2 = "TaserFramework:ClientActivateBarbs"
  L7_2 = A0_2
  L8_2 = nil
  L9_2 = true
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = TriggerClientEvent
  L6_2 = "TaserFramework:GiveNotification"
  L7_2 = L4_2
  L8_2 = main
  L8_2 = L8_2.translations
  L8_2 = L8_2.barbReactivated
  L9_2 = A3_2
  L10_2 = true
  L11_2 = A1_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2 = logToDiscord
  L6_2 = main
  L6_2 = L6_2.translations
  L6_2 = L6_2.eventType4
  L7_2 = A1_2
  L8_2 = L4_2
  L9_2 = A2_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "TaserFramework:ArcTase"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "TaserFramework:ArcTase"
function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = source
  if A3_2 then
    L5_2 = TriggerClientEvent
    L6_2 = "TaserFramework:ClientActivateBarbs"
    L7_2 = A0_2
    L8_2 = nil
    L9_2 = true
    L5_2(L6_2, L7_2, L8_2, L9_2)
    L5_2 = TriggerClientEvent
    L6_2 = "TaserFramework:GiveNotification"
    L7_2 = L4_2
    L8_2 = main
    L8_2 = L8_2.translations
    L8_2 = L8_2.arcTase
    L9_2 = nil
    L10_2 = true
    L11_2 = A1_2
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L5_2 = logToDiscord
    L6_2 = main
    L6_2 = L6_2.translations
    L6_2 = L6_2.eventType3
    L7_2 = A1_2
    L8_2 = L4_2
    L9_2 = A2_2
    L10_2 = nil
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  elseif not A3_2 then
    L5_2 = TriggerClientEvent
    L6_2 = "TaserFramework:ClientActivateBarbs"
    L7_2 = L4_2
    L8_2 = A0_2
    L9_2 = false
    L5_2(L6_2, L7_2, L8_2, L9_2)
    L5_2 = TriggerClientEvent
    L6_2 = "TaserFramework:GiveNotification"
    L7_2 = L4_2
    L8_2 = main
    L8_2 = L8_2.translations
    L8_2 = L8_2.arcTase
    L9_2 = nil
    L10_2 = true
    L11_2 = A1_2
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L5_2 = logToDiscord
    L6_2 = main
    L6_2 = L6_2.translations
    L6_2 = L6_2.eventType3
    L7_2 = A1_2
    L8_2 = L4_2
    L9_2 = A2_2
    L10_2 = nil
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "TaserFramework:ServerRemoveBarbs"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "TaserFramework:ServerRemoveBarbs"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = source
  if A1_2 then
    L3_2 = pairs
    L4_2 = L0_1
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      if L7_2 == L2_2 then
        L9_2 = L8_2.shooter
        if A0_2 == L9_2 then
          L9_2 = TriggerClientEvent
          L10_2 = "TaserFramework:GiveNotification"
          L11_2 = A0_2
          L12_2 = main
          L12_2 = L12_2.translations
          L12_2 = L12_2.barbsRemovedAutomaticallyOfficer
          L13_2 = nil
          L14_2 = false
          L15_2 = nil
          L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
          L9_2 = L0_1
          L9_2[L7_2] = nil
        end
      end
    end
  else
    L3_2 = pairs
    L4_2 = L0_1
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L8_2.shooter
      if L2_2 == L9_2 and L7_2 == A0_2 then
        L9_2 = TriggerClientEvent
        L10_2 = "TaserFramework:GiveNotification"
        L11_2 = A0_2
        L12_2 = main
        L12_2 = L12_2.translations
        L12_2 = L12_2.barbsRemovedAutomaticallyOfficer
        L13_2 = nil
        L14_2 = false
        L15_2 = nil
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
        L9_2 = L0_1
        L9_2[L7_2] = nil
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = main
L1_1 = L1_1.framework
L1_1 = L1_1.vRP
if not L1_1 then
  L1_1 = main
  L1_1 = L1_1.framework
  L1_1 = L1_1.ESX
  if not L1_1 then
    L1_1 = main
    L1_1 = L1_1.framework
    L1_1 = L1_1.QBCore
    if not L1_1 then
      goto lbl_100
    end
  end
end
L1_1 = RegisterNetEvent
L2_1 = "TaserFramework:ReloadTaser"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "TaserFramework:ReloadTaser"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = main
  L1_2 = L1_2.framework
  L1_2 = L1_2.vRP
  if L1_2 then
    L1_2 = vRP
    L1_2 = L1_2.getUserId
    L2_2 = {}
    L3_2 = A0_2
    L2_2[1] = L3_2
    L1_2 = L1_2(L2_2)
    L2_2 = vRP
    L2_2 = L2_2.tryGetInventoryItem
    L3_2 = {}
    L4_2 = L1_2
    L5_2 = main
    L5_2 = L5_2.framework
    L5_2 = L5_2.cartridgeItemName
    L6_2 = 1
    L7_2 = false
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L3_2[4] = L7_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = TriggerClientEvent
      L3_2 = "TaserFramework:ClientReloadTaser"
      L4_2 = A0_2
      L2_2(L3_2, L4_2)
      L2_2 = pairs
      L3_2 = L0_1
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = L7_2.shooter
        if L8_2 == A0_2 then
          L8_2 = L0_1
          L8_2[L6_2] = nil
        end
      end
    end
  else
    L1_2 = main
    L1_2 = L1_2.framework
    L1_2 = L1_2.QBCore
    if L1_2 then
      L1_2 = QBCore
      L1_2 = L1_2.Functions
      L1_2 = L1_2.GetPlayer
      L2_2 = A0_2
      L1_2 = L1_2(L2_2)
      L2_2 = L1_2.Functions
      L2_2 = L2_2.GetItemByName
      L3_2 = main
      L3_2 = L3_2.framework
      L3_2 = L3_2.cartridgeItemName
      L2_2 = L2_2(L3_2)
      if nil ~= L2_2 then
        L3_2 = L2_2.amount
        if L3_2 > 0 then
          L3_2 = TriggerClientEvent
          L4_2 = "inventory:client:ItemBox"
          L5_2 = A0_2
          L6_2 = QBCore
          L6_2 = L6_2.Shared
          L6_2 = L6_2.Items
          L7_2 = main
          L7_2 = L7_2.framework
          L7_2 = L7_2.cartridgeItemName
          L6_2 = L6_2[L7_2]
          L7_2 = "remove"
          L3_2(L4_2, L5_2, L6_2, L7_2)
          L3_2 = TriggerClientEvent
          L4_2 = "TaserFramework:ClientReloadTaser"
          L5_2 = A0_2
          L3_2(L4_2, L5_2)
          L3_2 = main
          L3_2 = L3_2.framework
          L3_2 = L3_2.alternativeQBCoreItemRemoval
          L3_2 = L3_2.enabled
          if L3_2 then
            L3_2 = TriggerServerEvent
            L4_2 = main
            L4_2 = L4_2.framework
            L4_2 = L4_2.alternativeQBCoreItemRemoval
            L4_2 = L4_2.eventToTrigger
            L5_2 = main
            L5_2 = L5_2.framework
            L5_2 = L5_2.cartridgeItemName
            L6_2 = 1
            L7_2 = A0_2
            L3_2(L4_2, L5_2, L6_2, L7_2)
          else
            L3_2 = L1_2.Functions
            L3_2 = L3_2.RemoveItem
            L4_2 = main
            L4_2 = L4_2.framework
            L4_2 = L4_2.cartridgeItemName
            L5_2 = 1
            L3_2(L4_2, L5_2)
          end
          L3_2 = pairs
          L4_2 = L0_1
          L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
          for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
            L9_2 = L8_2.shooter
            if L9_2 == A0_2 then
              L9_2 = L0_1
              L9_2[L7_2] = nil
            end
          end
        end
      end
    else
      L1_2 = main
      L1_2 = L1_2.framework
      L1_2 = L1_2.ESX
      if L1_2 then
        L1_2 = ESX
        L1_2 = L1_2.GetPlayerFromId
        L2_2 = A0_2
        L1_2 = L1_2(L2_2)
        L2_2 = L1_2.getInventoryItem
        L3_2 = main
        L3_2 = L3_2.framework
        L3_2 = L3_2.cartridgeItemName
        L2_2 = L2_2(L3_2)
        L3_2 = L2_2.count
        if L3_2 > 0 then
          L3_2 = L1_2.removeInventoryItem
          L4_2 = main
          L4_2 = L4_2.framework
          L4_2 = L4_2.cartridgeItemName
          L5_2 = 1
          L3_2(L4_2, L5_2)
          L3_2 = TriggerClientEvent
          L4_2 = "TaserFramework:ClientReloadTaser"
          L5_2 = A0_2
          L3_2(L4_2, L5_2)
          L3_2 = pairs
          L4_2 = L0_1
          L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
          for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
            L9_2 = L8_2.shooter
            if L9_2 == A0_2 then
              L9_2 = L0_1
              L9_2[L7_2] = nil
            end
          end
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
::lbl_100::
L1_1 = main
L1_1 = L1_1.framework
L1_1 = L1_1.vRP
if not L1_1 then
  L1_1 = main
  L1_1 = L1_1.framework
  L1_1 = L1_1.ESX
  if not L1_1 then
    L1_1 = main
    L1_1 = L1_1.framework
    L1_1 = L1_1.QBCore
    if not L1_1 then
      goto lbl_122
    end
  end
end
L1_1 = RegisterNetEvent
L2_1 = "TaserFramework:WeaponForReloadNotFound"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "TaserFramework:WeaponForReloadNotFound"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = source
  L3_2 = main
  L3_2 = L3_2.framework
  L3_2 = L3_2.vRP
  if L3_2 then
    L3_2 = vRP
    L3_2 = L3_2.getUserId
    L4_2 = {}
    L5_2 = L2_2
    L4_2[1] = L5_2
    L3_2 = L3_2(L4_2)
    L4_2 = vRP
    L4_2 = L4_2.giveInventoryItem
    L5_2 = {}
    L6_2 = L3_2
    L7_2 = main
    L7_2 = L7_2.framework
    L7_2 = L7_2.cartridgeItemName
    L8_2 = 1
    L9_2 = false
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L5_2[4] = L9_2
    L4_2(L5_2)
    if A0_2 then
      L4_2 = TriggerClientEvent
      L5_2 = "TaserFramework:GiveNotification"
      L6_2 = L2_2
      L7_2 = main
      L7_2 = L7_2.translations
      L7_2 = L7_2.weaponFull
      L8_2 = nil
      L9_2 = false
      L10_2 = A1_2
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    else
      L4_2 = TriggerClientEvent
      L5_2 = "TaserFramework:GiveNotification"
      L6_2 = L2_2
      L7_2 = main
      L7_2 = L7_2.translations
      L7_2 = L7_2.weaponNotFound
      L8_2 = nil
      L9_2 = false
      L10_2 = A1_2
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    end
  else
    L3_2 = main
    L3_2 = L3_2.framework
    L3_2 = L3_2.ESX
    if L3_2 then
      L3_2 = ESX
      L3_2 = L3_2.GetPlayerFromId
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = L3_2.addInventoryItem
      L5_2 = main
      L5_2 = L5_2.framework
      L5_2 = L5_2.cartridgeItemName
      L6_2 = 1
      L4_2(L5_2, L6_2)
      if A0_2 then
        L4_2 = TriggerClientEvent
        L5_2 = "TaserFramework:GiveNotification"
        L6_2 = L2_2
        L7_2 = main
        L7_2 = L7_2.translations
        L7_2 = L7_2.weaponFull
        L8_2 = nil
        L9_2 = false
        L10_2 = A1_2
        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
      else
        L4_2 = TriggerClientEvent
        L5_2 = "TaserFramework:GiveNotification"
        L6_2 = L2_2
        L7_2 = main
        L7_2 = L7_2.translations
        L7_2 = L7_2.weaponNotFound
        L8_2 = nil
        L9_2 = false
        L10_2 = A1_2
        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
      end
    else
      L3_2 = main
      L3_2 = L3_2.framework
      L3_2 = L3_2.QBCore
      if L3_2 then
        L3_2 = QBCore
        L3_2 = L3_2.Functions
        L3_2 = L3_2.GetPlayer
        L4_2 = L2_2
        L3_2 = L3_2(L4_2)
        L4_2 = TriggerClientEvent
        L5_2 = "inventory:client:ItemBox"
        L6_2 = L2_2
        L7_2 = QBCore
        L7_2 = L7_2.Shared
        L7_2 = L7_2.Items
        L8_2 = main
        L8_2 = L8_2.framework
        L8_2 = L8_2.cartridgeItemName
        L7_2 = L7_2[L8_2]
        L8_2 = "add"
        L4_2(L5_2, L6_2, L7_2, L8_2)
        L4_2 = L3_2.Functions
        L4_2 = L4_2.AddItem
        L5_2 = "main.framework.cartridgeItemName"
        L4_2(L5_2)
        if A0_2 then
          L4_2 = TriggerClientEvent
          L5_2 = "TaserFramework:GiveNotification"
          L6_2 = L2_2
          L7_2 = main
          L7_2 = L7_2.translations
          L7_2 = L7_2.weaponFull
          L8_2 = nil
          L9_2 = false
          L10_2 = A1_2
          L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
        else
          L4_2 = TriggerClientEvent
          L5_2 = "TaserFramework:GiveNotification"
          L6_2 = L2_2
          L7_2 = main
          L7_2 = L7_2.translations
          L7_2 = L7_2.weaponNotFound
          L8_2 = nil
          L9_2 = false
          L10_2 = A1_2
          L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
::lbl_122::
L1_1 = RegisterNetEvent
L2_1 = "playerDropped"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "playerDropped"
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = source
  L1_2 = pairs
  L2_2 = L0_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.shooter
    if L7_2 == L0_2 then
      L7_2 = L0_1
      L7_2[L5_2] = nil
    end
  end
end
L1_1(L2_1, L3_1)

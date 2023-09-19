local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = "left"
L1_1 = main
L1_1 = L1_1.safetyDefault
L2_1 = false
L3_1 = false
L4_1 = false
L5_1 = false
L6_1 = false
L7_1 = false
L8_1 = false
L9_1 = nil
L10_1 = nil
L11_1 = false
weapon = nil
ped = nil
L12_1 = false
L13_1 = main
L13_1 = L13_1.framework
L13_1 = L13_1.ESX
if not L13_1 then
  L13_1 = main
  L13_1 = L13_1.framework
  L13_1 = L13_1.QBCore
  if not L13_1 then
    L13_1 = main
    L13_1 = L13_1.framework
    L13_1 = L13_1.vRP
    if not L13_1 then
      goto lbl_35
    end
  end
end
L13_1 = main
L13_1 = L13_1.framework
L13_1.standalone = false
::lbl_35::
L13_1 = DecorRegister
L14_1 = "TaserTorch"
L15_1 = 2
L13_1(L14_1, L15_1)
L13_1 = DecorRegister
L14_1 = "TaserLaser"
L15_1 = 2
L13_1(L14_1, L15_1)
L13_1 = DecorRegister
L14_1 = "TaserLaserX"
L15_1 = 1
L13_1(L14_1, L15_1)
L13_1 = DecorRegister
L14_1 = "TaserLaserY"
L15_1 = 1
L13_1(L14_1, L15_1)
L13_1 = DecorRegister
L14_1 = "TaserLaserZ"
L15_1 = 1
L13_1(L14_1, L15_1)
L13_1 = TriggerEvent
L14_1 = "chat:addSuggestion"
L15_1 = "/"
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.removeBarbs
L15_1 = L15_1 .. L16_1
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.removeBarbsDescription
L13_1(L14_1, L15_1, L16_1)
L13_1 = main
L13_1 = L13_1.framework
L13_1 = L13_1.standalone
if L13_1 then
  L13_1 = TriggerEvent
  L14_1 = "chat:addSuggestion"
  L15_1 = "/"
  L16_1 = main
  L16_1 = L16_1.commands
  L16_1 = L16_1.reloadTaser
  L15_1 = L15_1 .. L16_1
  L16_1 = main
  L16_1 = L16_1.commands
  L16_1 = L16_1.reloadTaserDescription
  L13_1(L14_1, L15_1, L16_1)
end
L13_1 = Citizen
L13_1 = L13_1.CreateThread
function L14_1()
  local L0_2, L1_2
  L0_2 = Wait
  L1_2 = 4000
  L0_2(L1_2)
  while "ped" do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    ped = L0_2
    L0_2 = GetSelectedPedWeapon
    L1_2 = ped
    L0_2 = L0_2(L1_2)
    weapon = L0_2
    L0_2 = Wait
    L1_2 = 1500
    L0_2(L1_2)
  end
end
L13_1(L14_1)
L13_1 = false
L14_1 = Citizen
L14_1 = L14_1.CreateThread
function L15_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = Wait
  L1_2 = 5000
  L0_2(L1_2)
  L0_2 = main
  L0_2 = L0_2.soundVolume
  if L0_2 > 1.0 then
    L0_2 = main
    L0_2.soundVolume = 1.0
  end
  while true do
    L0_2 = L13_1
    if L0_2 then
      L0_2 = GetCamMatrix
      L1_2 = 0
      L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
      L4_2 = GetGameplayCamRot
      L4_2 = L4_2()
      L5_2 = GetGameplayCamCoord
      L5_2 = L5_2()
      L6_2 = RotationToDirection
      L7_2 = L4_2.x
      L8_2 = L4_2.y
      L9_2 = L4_2.z
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L7_2 = SendNUIMessage
      L8_2 = {}
      L8_2.transactionType = "setOrientation"
      L8_2.fwd = L6_2
      L9_2 = vector3
      L10_2 = 0.0
      L11_2 = 0.0
      L12_2 = 1.0
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      L8_2.up = L9_2
      L8_2.coord = L5_2
      L7_2(L8_2)
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
end
L14_1(L15_1)
L14_1 = RegisterNetEvent
L15_1 = "TaserFramework:playAudioClient"
L14_1(L15_1)
L14_1 = AddEventHandler
L15_1 = "TaserFramework:playAudioClient"
function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = PlaySound
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
end
L14_1(L15_1, L16_1)
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = GetEntityCoords
  L3_2 = ped
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2 - A0_2
  L3_2 = #L3_2
  L4_2 = 25.5
  if L3_2 < L4_2 then
    L3_2 = SendNUIMessage
    L4_2 = {}
    L4_2.transactionType = "playSound"
    L4_2.position = A0_2
    L5_2 = main
    L5_2 = L5_2.soundVolume
    L4_2.volume = L5_2
    L4_2.sound = A1_2
    L3_2(L4_2)
    L3_2 = true
    L13_1 = L3_2
  end
  L3_2 = Citizen
  L3_2 = L3_2.SetTimeout
  L4_2 = 6000
  function L5_2()
    local L0_3, L1_3
    L0_3 = false
    L13_1 = L0_3
  end
  L3_2(L4_2, L5_2)
end
PlaySound = L14_1
L14_1 = Citizen
L14_1 = L14_1.CreateThread
function L15_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = 2000
  L1_2 = Wait
  L2_2 = 5000
  L1_2(L2_2)
  L1_2 = DecorSetBool
  L2_2 = ped
  L3_2 = "TaserTorch"
  L4_2 = false
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = DecorSetBool
  L2_2 = ped
  L3_2 = "TaserLaser"
  L4_2 = false
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = RequestStreamedTextureDict
  L2_2 = "cid"
  L1_2(L2_2)
  while true do
    L1_2 = HasStreamedTextureDictLoaded
    L2_2 = "cid"
    L1_2 = L1_2(L2_2)
    if L1_2 then
      break
    end
    L1_2 = RequestStreamedTextureDict
    L2_2 = "cid"
    L1_2(L2_2)
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
  end
  while true do
    L1_2 = tasers
    L2_2 = weapon
    L1_2 = L1_2[L2_2]
    if nil ~= L1_2 then
      L0_2 = 0
      L1_2 = PlayerId
      L1_2 = L1_2()
      L2_2 = tasers
      L3_2 = weapon
      L2_2 = L2_2[L3_2]
      L2_2 = L2_2.loadedCartridges
      if 0 ~= L2_2 then
        L2_2 = L1_1
        if not L2_2 then
          goto lbl_56
        end
      end
      L2_2 = L1_1
      if not L2_2 then
        L2_2 = nil
        L0_1 = L2_2
      end
      L2_2 = DisablePlayerFiring
      L3_2 = L1_2
      L4_2 = true
      L2_2(L3_2, L4_2)
      ::lbl_56::
      L2_2 = IsPedShooting
      L3_2 = ped
      L2_2 = L2_2(L3_2)
      if L2_2 then
        L2_2 = tasers
        L3_2 = weapon
        L2_2 = L2_2[L3_2]
        L3_2 = tasers
        L4_2 = weapon
        L3_2 = L3_2[L4_2]
        L3_2 = L3_2.loadedCartridges
        L3_2 = L3_2 - 1
        L2_2.loadedCartridges = L3_2
        L2_2 = GetEntityCoords
        L3_2 = ped
        L2_2 = L2_2(L3_2)
        L3_2 = TriggerServerEvent
        L4_2 = "TaserFramework:playAudio"
        L5_2 = L2_2
        L6_2 = "./taser.ogg"
        L3_2(L4_2, L5_2, L6_2)
        L3_2 = GetCurrentPedWeaponEntityIndex
        L4_2 = ped
        L3_2 = L3_2(L4_2)
        L4_2 = GetEntityPlayerIsFreeAimingAt
        L5_2 = L1_2
        L4_2, L5_2 = L4_2(L5_2)
        L6_2 = DoesEntityExist
        L7_2 = L5_2
        L6_2 = L6_2(L7_2)
        if L6_2 then
          L6_2 = IsEntityAPed
          L7_2 = L5_2
          L6_2 = L6_2(L7_2)
          if L6_2 then
            L6_2 = IsPedInAnyVehicle
            L7_2 = L5_2
            L8_2 = false
            L6_2 = L6_2(L7_2, L8_2)
            if not L6_2 then
              L6_2 = IsPedAPlayer
              L7_2 = L5_2
              L6_2 = L6_2(L7_2)
              if not L6_2 then
                L6_2 = NetworkGetNetworkIdFromEntity
                L7_2 = L5_2
                L6_2 = L6_2(L7_2)
                L7_2 = TriggerServerEvent
                L8_2 = "TaserFramework:addCartridge"
                L9_2 = L6_2
                L10_2 = L0_1
                L11_2 = false
                L12_2 = weapon
                L13_2 = tasers
                L14_2 = weapon
                L13_2 = L13_2[L14_2]
                L13_2 = L13_2.loadedCartridges
                L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              else
                L6_2 = GetPlayerServerId
                L7_2 = NetworkGetPlayerIndexFromPed
                L8_2 = L5_2
                L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L7_2(L8_2)
                L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
                L7_2 = TriggerServerEvent
                L8_2 = "TaserFramework:addCartridge"
                L9_2 = L6_2
                L10_2 = L0_1
                L11_2 = true
                L12_2 = weapon
                L13_2 = tasers
                L14_2 = weapon
                L13_2 = L13_2[L14_2]
                L13_2 = L13_2.loadedCartridges
                L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              end
            end
        end
        else
          L6_2 = TriggerServerEvent
          L7_2 = "TaserFramework:MissedShot"
          L8_2 = weapon
          L9_2 = L0_1
          L10_2 = tasers
          L11_2 = weapon
          L10_2 = L10_2[L11_2]
          L10_2 = L10_2.loadedCartridges
          L6_2(L7_2, L8_2, L9_2, L10_2)
        end
        L6_2 = L0_1
        if "left" == L6_2 then
          L6_2 = true
          L3_1 = L6_2
          L6_2 = L2_1
          if not L6_2 then
            L6_2 = "right"
            L0_1 = L6_2
          end
        else
          L6_2 = L0_1
          if "right" == L6_2 then
            L6_2 = true
            L2_1 = L6_2
            L6_2 = L3_1
            if not L6_2 then
              L6_2 = "left"
              L0_1 = L6_2
            end
          end
        end
      end
    else
      L0_2 = 2000
    end
    L1_2 = Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L14_1(L15_1)
L14_1 = Citizen
L14_1 = L14_1.CreateThread
function L15_1()
  local L0_2, L1_2, L2_2
  L0_2 = 2000
  L1_2 = Wait
  L2_2 = 5000
  L1_2(L2_2)
  while true do
    L1_2 = tasers
    L2_2 = weapon
    L1_2 = L1_2[L2_2]
    if nil ~= L1_2 then
      L0_2 = 0
      L1_2 = EnableDisableDecors
      L2_2 = ped
      L1_2(L2_2)
      L1_2 = renderUI
      L2_2 = weapon
      L1_2(L2_2)
    else
      L0_2 = 2000
    end
    L1_2 = Wait
    L2_2 = L0_2
    L1_2(L2_2)
  end
end
L14_1(L15_1)
L14_1 = {}
function L15_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.destructor
  if L1_2 then
    L1_2 = A0_2.handle
    if L1_2 then
      L1_2 = A0_2.destructor
      L2_2 = A0_2.handle
      L1_2(L2_2)
    end
  end
  A0_2.destructor = nil
  A0_2.handle = nil
end
L14_1.__gc = L15_1
function L15_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = coroutine
  L3_2 = L3_2.wrap
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = A0_2
    L0_3, L1_3 = L0_3()
    if not L1_3 or 0 == L1_3 then
      L2_3 = A2_2
      L3_3 = L0_3
      L2_3(L3_3)
      return
    end
    L2_3 = {}
    L2_3.handle = L0_3
    L3_3 = A2_2
    L2_3.destructor = L3_3
    L3_3 = setmetatable
    L4_3 = L2_3
    L5_3 = L14_1
    L3_3(L4_3, L5_3)
    L3_3 = true
    repeat
      L4_3 = coroutine
      L4_3 = L4_3.yield
      L5_3 = L1_3
      L4_3(L5_3)
      L4_3 = A1_2
      L5_3 = L0_3
      L4_3, L5_3 = L4_3(L5_3)
      L1_3 = L5_3
      L3_3 = L4_3
    until not L3_3
    L4_3 = nil
    L2_3.handle = nil
    L2_3.destructor = L4_3
    L4_3 = A2_2
    L5_3 = L0_3
    L4_3(L5_3)
  end
  return L3_2(L4_2)
end
EnumerateEntities = L15_1
function L15_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = EnumerateEntities
  L1_2 = FindFirstPed
  L2_2 = FindNextPed
  L3_2 = EndFindPed
  return L0_2(L1_2, L2_2, L3_2)
end
EnumeratePeds = L15_1
L15_1 = Citizen
L15_1 = L15_1.CreateThread
function L16_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  L0_2 = Wait
  L1_2 = 5000
  L0_2(L1_2)
  L0_2 = nil
  L1_2 = nil
  while true do
    L2_2 = pairs
    L3_2 = GetActivePlayers
    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L3_2()
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = GetPlayerPed
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      L9_2 = DecorGetBool
      L10_2 = L8_2
      L11_2 = "TaserTorch"
      L9_2 = L9_2(L10_2, L11_2)
      L10_2 = DecorGetBool
      L11_2 = L8_2
      L12_2 = "TaserLaser"
      L10_2 = L10_2(L11_2, L12_2)
      if L9_2 or L10_2 then
        L11_2 = GetEntityCoords
        L12_2 = L8_2
        L11_2 = L11_2(L12_2)
        L0_2 = L11_2
        L11_2 = GetSelectedPedWeapon
        L12_2 = L8_2
        L11_2 = L11_2(L12_2)
        L1_2 = L11_2
      end
      if L9_2 then
        L11_2 = GetEntityForwardVector
        L12_2 = L8_2
        L11_2 = L11_2(L12_2)
        L12_2 = tasers
        L12_2 = L12_2[L1_2]
        if nil ~= L12_2 then
          L12_2 = DrawSpotLight
          L13_2 = L0_2.x
          L14_2 = L0_2.y
          L15_2 = L0_2.z
          L16_2 = L11_2.x
          L17_2 = L11_2.y
          L18_2 = L11_2.z
          L19_2 = main
          L19_2 = L19_2.flashlightColour
          L19_2 = L19_2[1]
          L20_2 = main
          L20_2 = L20_2.flashlightColour
          L20_2 = L20_2[2]
          L21_2 = main
          L21_2 = L21_2.flashlightColour
          L21_2 = L21_2[3]
          L22_2 = 10.0
          L23_2 = 70.0
          L24_2 = 4.3
          L25_2 = 18.0
          L26_2 = 28.6
          L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
        end
      end
      if L10_2 then
        L11_2 = GetCurrentPedWeaponEntityIndex
        L12_2 = L8_2
        L11_2 = L11_2(L12_2)
        L12_2 = GetOffsetFromEntityInWorldCoords
        L13_2 = L11_2
        L14_2 = 0
        L15_2 = 0
        L16_2 = -0.01
        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
        L13_2 = RayCastPed
        L14_2 = L12_2
        L15_2 = main
        L15_2 = L15_2.laserSightRange
        L16_2 = L8_2
        L13_2, L14_2 = L13_2(L14_2, L15_2, L16_2)
        L15_2 = tasers
        L15_2 = L15_2[L1_2]
        if nil ~= L15_2 and 0 ~= L13_2 then
          L15_2 = DrawLine
          L16_2 = L12_2.x
          L17_2 = L12_2.y
          L18_2 = L12_2.z
          L19_2 = L14_2.x
          L20_2 = L14_2.y
          L21_2 = L14_2.z
          L22_2 = main
          L22_2 = L22_2.laserSightColour
          L22_2 = L22_2[1]
          L23_2 = main
          L23_2 = L23_2.laserSightColour
          L23_2 = L23_2[2]
          L24_2 = main
          L24_2 = L24_2.laserSightColour
          L24_2 = L24_2[3]
          L25_2 = 255
          L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
          L15_2 = DrawSphere2
          L16_2 = L14_2
          L17_2 = 0.01
          L18_2 = 255
          L19_2 = 0
          L20_2 = 0
          L21_2 = 255
          L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
        end
      end
    end
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
  end
end
L15_1(L16_1)
L15_1 = RegisterNetEvent
L16_1 = "TaserFramework:ClientTaseEntity"
L15_1(L16_1)
L15_1 = AddEventHandler
L16_1 = "TaserFramework:ClientTaseEntity"
function L17_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A1_2 then
    L3_2 = TriggerServerEvent
    L4_2 = "TaserFramework:ServerActivateBarbs"
    L5_2 = A0_2
    L6_2 = weapon
    L7_2 = tasers
    L8_2 = weapon
    L7_2 = L7_2[L8_2]
    L7_2 = L7_2.loadedCartridges
    L8_2 = A2_2
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  else
    L3_2 = NetworkGetEntityFromNetworkId
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L4_2 = DoesEntityExist
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = GetEntityHealth
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      if L4_2 > 0 then
        L5_2 = TriggerEvent
        L6_2 = "TaserFramework:GiveNotification"
        L7_2 = main
        L7_2 = L7_2.translations
        L7_2 = L7_2.barbReactivated
        L8_2 = A2_2
        L9_2 = true
        L10_2 = weapon
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
        L5_2 = SetPedToRagdoll
        L6_2 = L3_2
        L7_2 = 5000
        L8_2 = 5000
        L9_2 = 0
        L10_2 = true
        L11_2 = true
        L12_2 = false
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      end
    end
  end
end
L15_1(L16_1, L17_1)
L15_1 = RegisterNetEvent
L16_1 = "TaserFramework:SendShooter"
L15_1(L16_1)
L15_1 = AddEventHandler
L16_1 = "TaserFramework:SendShooter"
function L17_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A1_2 then
    L2_2 = true
    L9_1 = L2_2
    L2_2 = GetPlayerFromServerId
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L3_2 = GetPlayerPed
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = true
    L9_1 = L4_2
    while true do
      L4_2 = L9_1
      if not L4_2 then
        break
      end
      L4_2 = GetEntityCoords
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      L5_2 = GetEntityCoords
      L6_2 = ped
      L5_2 = L5_2(L6_2)
      L6_2 = L4_2 - L5_2
      L6_2 = #L6_2
      L7_2 = main
      L7_2 = L7_2.rangeToRemoveBarbs
      if L6_2 >= L7_2 then
        L6_2 = TriggerServerEvent
        L7_2 = "TaserFramework:ServerRemoveBarbs"
        L8_2 = A0_2
        L9_2 = true
        L6_2(L7_2, L8_2, L9_2)
        L6_2 = TriggerEvent
        L7_2 = "TaserFramework:GiveNotification"
        L8_2 = main
        L8_2 = L8_2.translations
        L8_2 = L8_2.barbsRemovedAutomatically
        L9_2 = nil
        L10_2 = true
        L11_2 = nil
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
        L6_2 = false
        L9_1 = L6_2
      end
      L6_2 = Wait
      L7_2 = 0
      L6_2(L7_2)
    end
  else
    L2_2 = NetworkGetEntityFromNetworkId
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    while true do
      L3_2 = GetEntityCoords
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L4_2 = GetEntityCoords
      L5_2 = ped
      L4_2 = L4_2(L5_2)
      L5_2 = DoesEntityExist
      L6_2 = L2_2
      L5_2 = L5_2(L6_2)
      if L5_2 then
        L5_2 = L3_2 - L4_2
        L5_2 = #L5_2
        L6_2 = main
        L6_2 = L6_2.rangeToRemoveBarbs
        if L5_2 >= L6_2 then
          L5_2 = TriggerEvent
          L6_2 = "TaserFramework:GiveNotification"
          L7_2 = main
          L7_2 = L7_2.translations
          L7_2 = L7_2.barbsRemovedAutomaticallyOfficer
          L8_2 = nil
          L9_2 = true
          L10_2 = nil
          L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
          L5_2 = TriggerServerEvent
          L6_2 = "TaserFramework:ServerRemoveBarbs"
          L7_2 = A0_2
          L8_2 = false
          L5_2(L6_2, L7_2, L8_2)
          return
        end
      else
        L5_2 = TriggerEvent
        L6_2 = "TaserFramework:GiveNotification"
        L7_2 = main
        L7_2 = L7_2.translations
        L7_2 = L7_2.barbsRemovedAutomaticallyOfficer
        L8_2 = nil
        L9_2 = true
        L10_2 = nil
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
        L5_2 = TriggerServerEvent
        L6_2 = "TaserFramework:ServerRemoveBarbs"
        L7_2 = A0_2
        L8_2 = false
        L5_2(L6_2, L7_2, L8_2)
        return
      end
      L5_2 = Wait
      L6_2 = 0
      L5_2(L6_2)
    end
  end
end
L15_1(L16_1, L17_1)
L15_1 = RegisterNetEvent
L16_1 = "TaserFramework:ClientActivateBarbs"
L15_1(L16_1)
L15_1 = AddEventHandler
L16_1 = "TaserFramework:ClientActivateBarbs"
function L17_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = GetEntityHealth
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 > 0 then
    if A1_2 then
      L4_2 = SetPedToRagdoll
      L5_2 = L2_2
      L6_2 = 5000
      L7_2 = 5000
      L8_2 = 0
      L9_2 = true
      L10_2 = true
      L11_2 = false
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    elseif nil ~= A0_2 and not A1_2 then
      L4_2 = NetworkGetEntityFromNetworkId
      L5_2 = A0_2
      L4_2 = L4_2(L5_2)
      L5_2 = DoesEntityExist
      L6_2 = L4_2
      L5_2 = L5_2(L6_2)
      if L5_2 then
        L5_2 = SetPedToRagdoll
        L6_2 = L4_2
        L7_2 = 5000
        L8_2 = 5000
        L9_2 = 0
        L10_2 = true
        L11_2 = true
        L12_2 = false
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      end
    end
  end
end
L15_1(L16_1, L17_1)
L15_1 = RegisterNetEvent
L16_1 = "TaserFramework:GiveNotification"
L15_1(L16_1)
L15_1 = AddEventHandler
L16_1 = "TaserFramework:GiveNotification"
function L17_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = main
  L4_2 = L4_2.notifications
  L4_2 = L4_2.gtaAboveMap
  L5_2 = main
  L5_2 = L5_2.notifications
  L5_2 = L5_2.mythicNotify
  L5_2 = L5_2.enabled
  L6_2 = GetEntityCoords
  L7_2 = ped
  L6_2 = L6_2(L7_2)
  if nil ~= A1_2 then
    L7_2 = TriggerServerEvent
    L8_2 = "TaserFramework:playAudio"
    L9_2 = L6_2
    L10_2 = "./reactivate.ogg"
    L7_2(L8_2, L9_2, L10_2)
    if "left" == A1_2 then
      if L4_2 then
        L7_2 = tasers
        L7_2 = L7_2[A3_2]
        if nil ~= L7_2 then
          L7_2 = alert
          L8_2 = "~h~~r~"
          L9_2 = tasers
          L9_2 = L9_2[A3_2]
          L9_2 = L9_2.name
          L10_2 = [[
~s~~h~: 
~w~]]
          L11_2 = main
          L11_2 = L11_2.translations
          L11_2 = L11_2.left
          L12_2 = A0_2
          L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
          L7_2(L8_2)
        else
          L7_2 = alert
          L8_2 = [[
~h~~r~TASER~s~~h~: 
~w~]]
          L9_2 = main
          L9_2 = L9_2.translations
          L9_2 = L9_2.left
          L10_2 = A0_2
          L8_2 = L8_2 .. L9_2 .. L10_2
          L7_2(L8_2)
        end
      end
      if L5_2 then
        if A2_2 then
          L7_2 = exports
          L8_2 = main
          L8_2 = L8_2.notifications
          L8_2 = L8_2.mythicNotify
          L8_2 = L8_2.mythicNotifyResourceName
          L7_2 = L7_2[L8_2]
          L8_2 = L7_2
          L7_2 = L7_2.DoHudText
          L9_2 = "success"
          L10_2 = main
          L10_2 = L10_2.translations
          L10_2 = L10_2.left
          L11_2 = A0_2
          L10_2 = L10_2 .. L11_2
          L7_2(L8_2, L9_2, L10_2)
        else
          L7_2 = exports
          L8_2 = main
          L8_2 = L8_2.notifications
          L8_2 = L8_2.mythicNotify
          L8_2 = L8_2.mythicNotifyResourceName
          L7_2 = L7_2[L8_2]
          L8_2 = L7_2
          L7_2 = L7_2.DoHudText
          L9_2 = "error"
          L10_2 = main
          L10_2 = L10_2.translations
          L10_2 = L10_2.left
          L11_2 = A0_2
          L10_2 = L10_2 .. L11_2
          L7_2(L8_2, L9_2, L10_2)
        end
      end
    elseif "right" == A1_2 then
      L7_2 = tasers
      L7_2 = L7_2[A3_2]
      if nil ~= L7_2 then
        L7_2 = alert
        L8_2 = "~h~~r~"
        L9_2 = tasers
        L9_2 = L9_2[A3_2]
        L9_2 = L9_2.name
        L10_2 = [[
~s~~h~: 
~w~]]
        L11_2 = main
        L11_2 = L11_2.translations
        L11_2 = L11_2.right
        L12_2 = A0_2
        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
        L7_2(L8_2)
      else
        L7_2 = alert
        L8_2 = [[
~h~~r~TASER~s~~h~: 
~w~]]
        L9_2 = main
        L9_2 = L9_2.translations
        L9_2 = L9_2.right
        L10_2 = A0_2
        L8_2 = L8_2 .. L9_2 .. L10_2
        L7_2(L8_2)
      end
      if L5_2 then
        L7_2 = exports
        L8_2 = main
        L8_2 = L8_2.notifications
        L8_2 = L8_2.mythicNotify
        L8_2 = L8_2.mythicNotifyResourceName
        L7_2 = L7_2[L8_2]
        L8_2 = L7_2
        L7_2 = L7_2.DoHudText
        L9_2 = "success"
        L10_2 = main
        L10_2 = L10_2.translations
        L10_2 = L10_2.right
        L11_2 = A0_2
        L10_2 = L10_2 .. L11_2
        L7_2(L8_2, L9_2, L10_2)
      else
        L7_2 = exports
        L8_2 = main
        L8_2 = L8_2.notifications
        L8_2 = L8_2.mythicNotify
        L8_2 = L8_2.mythicNotifyResourceName
        L7_2 = L7_2[L8_2]
        L8_2 = L7_2
        L7_2 = L7_2.DoHudText
        L9_2 = "error"
        L10_2 = main
        L10_2 = L10_2.translations
        L10_2 = L10_2.right
        L11_2 = A0_2
        L10_2 = L10_2 .. L11_2
        L7_2(L8_2, L9_2, L10_2)
      end
    end
  else
    if L5_2 then
      if A2_2 then
        L7_2 = exports
        L8_2 = main
        L8_2 = L8_2.notifications
        L8_2 = L8_2.mythicNotify
        L8_2 = L8_2.mythicNotifyResourceName
        L7_2 = L7_2[L8_2]
        L8_2 = L7_2
        L7_2 = L7_2.DoHudText
        L9_2 = "success"
        L10_2 = A0_2
        L7_2(L8_2, L9_2, L10_2)
      else
        L7_2 = exports
        L8_2 = main
        L8_2 = L8_2.notifications
        L8_2 = L8_2.mythicNotify
        L8_2 = L8_2.mythicNotifyResourceName
        L7_2 = L7_2[L8_2]
        L8_2 = L7_2
        L7_2 = L7_2.DoHudText
        L9_2 = "error"
        L10_2 = A0_2
        L7_2(L8_2, L9_2, L10_2)
      end
    end
    if L4_2 then
      L7_2 = tasers
      L7_2 = L7_2[A3_2]
      if nil ~= L7_2 then
        L7_2 = alert
        L8_2 = "~h~~r~"
        L9_2 = tasers
        L9_2 = L9_2[A3_2]
        L9_2 = L9_2.name
        L10_2 = [[
~s~~h~: 
~w~]]
        L11_2 = A0_2
        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
        L7_2(L8_2)
      else
        L7_2 = alert
        L8_2 = [[
~h~~r~TASER~s~~h~: 
~w~]]
        L9_2 = A0_2
        L8_2 = L8_2 .. L9_2
        L7_2(L8_2)
      end
    end
  end
end
L15_1(L16_1, L17_1)
L15_1 = main
L15_1 = L15_1.framework
L15_1 = L15_1.ESX
if not L15_1 then
  L15_1 = main
  L15_1 = L15_1.framework
  L15_1 = L15_1.QBCore
  if not L15_1 then
    L15_1 = main
    L15_1 = L15_1.framework
    L15_1 = L15_1.vRP
    if not L15_1 then
      goto lbl_170
    end
  end
end
L15_1 = RegisterNetEvent
L16_1 = "TaserFramework:ClientReloadTaser"
L15_1(L16_1)
L15_1 = AddEventHandler
L16_1 = "TaserFramework:ClientReloadTaser"
function L17_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = tasers
  L1_2 = weapon
  L0_2 = L0_2[L1_2]
  if nil ~= L0_2 then
    L0_2 = tasers
    L1_2 = weapon
    L0_2 = L0_2[L1_2]
    L0_2 = L0_2.loadedCartridges
    if 0 == L0_2 then
      L0_2 = tasers
      L1_2 = weapon
      L0_2 = L0_2[L1_2]
      L0_2.loadedCartridges = 1
      L0_2 = "left"
      L0_1 = L0_2
      L0_2 = false
      L3_1 = L0_2
      L0_2 = TriggerEvent
      L1_2 = "TaserFramework:GiveNotification"
      L2_2 = main
      L2_2 = L2_2.translations
      L2_2 = L2_2.taserReloaded
      L3_2 = nil
      L4_2 = true
      L0_2(L1_2, L2_2, L3_2, L4_2)
    else
      L0_2 = tasers
      L1_2 = weapon
      L0_2 = L0_2[L1_2]
      L0_2 = L0_2.loadedCartridges
      if 1 == L0_2 then
        L0_2 = tasers
        L1_2 = weapon
        L0_2 = L0_2[L1_2]
        L0_2.loadedCartridges = 2
        L0_2 = "right"
        L0_1 = L0_2
        L0_2 = false
        L3_1 = L0_2
        L0_2 = false
        L2_1 = L0_2
        L0_2 = TriggerEvent
        L1_2 = "TaserFramework:GiveNotification"
        L2_2 = main
        L2_2 = L2_2.translations
        L2_2 = L2_2.taserReloaded
        L3_2 = nil
        L4_2 = true
        L0_2(L1_2, L2_2, L3_2, L4_2)
      else
        L0_2 = tasers
        L1_2 = weapon
        L0_2 = L0_2[L1_2]
        L0_2 = L0_2.loadedCartridges
        if 2 == L0_2 then
          L0_2 = TriggerServerEvent
          L1_2 = "TaserFramework:WeaponForReloadNotFound"
          L2_2 = true
          L3_2 = weapon
          L0_2(L1_2, L2_2, L3_2)
        end
      end
    end
  else
    L0_2 = TriggerServerEvent
    L1_2 = "TaserFramework:WeaponForReloadNotFound"
    L2_2 = false
    L3_2 = weapon
    L0_2(L1_2, L2_2, L3_2)
  end
end
L15_1(L16_1, L17_1)
::lbl_170::
L15_1 = main
L15_1 = L15_1.framework
L15_1 = L15_1.standalone
if L15_1 then
  L15_1 = RegisterCommand
  L16_1 = main
  L16_1 = L16_1.commands
  L16_1 = L16_1.reloadTaser
  function L17_1()
    local L0_2, L1_2
    L0_2 = tasers
    L1_2 = weapon
    L0_2 = L0_2[L1_2]
    if nil ~= L0_2 then
      L0_2 = tasers
      L1_2 = weapon
      L0_2 = L0_2[L1_2]
      L0_2 = L0_2.loadedCartridges
      if 0 == L0_2 then
        L0_2 = tasers
        L1_2 = weapon
        L0_2 = L0_2[L1_2]
        L0_2.loadedCartridges = 1
        L0_2 = "left"
        L0_1 = L0_2
        L0_2 = false
        L3_1 = L0_2
      else
        L0_2 = tasers
        L1_2 = weapon
        L0_2 = L0_2[L1_2]
        L0_2 = L0_2.loadedCartridges
        if 1 == L0_2 then
          L0_2 = tasers
          L1_2 = weapon
          L0_2 = L0_2[L1_2]
          L0_2.loadedCartridges = 2
          L0_2 = "left"
          L0_1 = L0_2
          L0_2 = false
          L3_1 = L0_2
          L0_2 = false
          L2_1 = L0_2
        end
      end
    end
  end
  L15_1(L16_1, L17_1)
end
L15_1 = RegisterCommand
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.removeBarbs
function L17_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = GetClosestPlayer
  L1_2 = 3
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L1_2 = GetPlayerServerId
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = TriggerServerEvent
    L3_2 = "TaserFramework:RemoveShooterBarbs"
    L4_2 = L1_2
    L5_2 = true
    L2_2(L3_2, L4_2, L5_2)
  else
    L1_2 = GetClosestNPC
    L2_2 = 3
    L1_2 = L1_2(L2_2)
    if nil ~= L1_2 then
      L2_2 = NetworkGetNetworkIdFromEntity
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      L3_2 = TriggerServerEvent
      L4_2 = "TaserFramework:RemoveShooterBarbs"
      L5_2 = L2_2
      L6_2 = false
      L3_2(L4_2, L5_2, L6_2)
    end
  end
end
L15_1(L16_1, L17_1)
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = tasers
  L1_2 = L1_2[A0_2]
  L1_2 = L1_2.loadedCartridges
  if 2 == L1_2 then
    L1_2 = L0_1
    if "left" == L1_2 then
      L1_2 = L1_1
      if L1_2 then
        L1_2 = DrawSprite
        L2_2 = "cid"
        L3_2 = "LeftCartridgeSafetyOn"
        L4_2 = main
        L4_2 = L4_2.cidXY
        L4_2 = L4_2[1]
        L5_2 = main
        L5_2 = L5_2.cidXY
        L5_2 = L5_2[2]
        L6_2 = 0.125
        L7_2 = 0.125
        L8_2 = 0.0
        L9_2 = 255
        L10_2 = 255
        L11_2 = 255
        L12_2 = 255
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        return
      end
    end
  end
  L1_2 = tasers
  L1_2 = L1_2[A0_2]
  L1_2 = L1_2.loadedCartridges
  if 1 == L1_2 then
    L1_2 = L0_1
    if "left" == L1_2 then
      L1_2 = L1_1
      if not L1_2 then
        L1_2 = DrawSprite
        L2_2 = "cid"
        L3_2 = "LeftCartridgeSelectedRightUsedSafetyOff"
        L4_2 = main
        L4_2 = L4_2.cidXY
        L4_2 = L4_2[1]
        L5_2 = main
        L5_2 = L5_2.cidXY
        L5_2 = L5_2[2]
        L6_2 = 0.125
        L7_2 = 0.125
        L8_2 = 0.0
        L9_2 = 255
        L10_2 = 255
        L11_2 = 255
        L12_2 = 255
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        return
      end
    end
  end
  L1_2 = tasers
  L1_2 = L1_2[A0_2]
  L1_2 = L1_2.loadedCartridges
  if 1 == L1_2 then
    L1_2 = L0_1
    if "left" == L1_2 then
      L1_2 = L1_1
      if L1_2 then
        L1_2 = DrawSprite
        L2_2 = "cid"
        L3_2 = "LeftCartridgeSelectedRightUsedSafetyOn"
        L4_2 = main
        L4_2 = L4_2.cidXY
        L4_2 = L4_2[1]
        L5_2 = main
        L5_2 = L5_2.cidXY
        L5_2 = L5_2[2]
        L6_2 = 0.125
        L7_2 = 0.125
        L8_2 = 0.0
        L9_2 = 255
        L10_2 = 255
        L11_2 = 255
        L12_2 = 255
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        return
      end
    end
  end
  L1_2 = tasers
  L1_2 = L1_2[A0_2]
  L1_2 = L1_2.loadedCartridges
  if 1 == L1_2 then
    L1_2 = L0_1
    if "right" == L1_2 then
      L1_2 = L1_1
      if not L1_2 then
        L1_2 = DrawSprite
        L2_2 = "cid"
        L3_2 = "RightCartridgeSelectedLeftUsedSafetyOff"
        L4_2 = main
        L4_2 = L4_2.cidXY
        L4_2 = L4_2[1]
        L5_2 = main
        L5_2 = L5_2.cidXY
        L5_2 = L5_2[2]
        L6_2 = 0.125
        L7_2 = 0.125
        L8_2 = 0.0
        L9_2 = 255
        L10_2 = 255
        L11_2 = 255
        L12_2 = 255
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        return
      end
    end
  end
  L1_2 = tasers
  L1_2 = L1_2[A0_2]
  L1_2 = L1_2.loadedCartridges
  if 1 == L1_2 then
    L1_2 = L0_1
    if "right" == L1_2 then
      L1_2 = L1_1
      if L1_2 then
        L1_2 = DrawSprite
        L2_2 = "cid"
        L3_2 = "RightCartridgeSelectedLeftUsedSafetyOn"
        L4_2 = main
        L4_2 = L4_2.cidXY
        L4_2 = L4_2[1]
        L5_2 = main
        L5_2 = L5_2.cidXY
        L5_2 = L5_2[2]
        L6_2 = 0.125
        L7_2 = 0.125
        L8_2 = 0.0
        L9_2 = 255
        L10_2 = 255
        L11_2 = 255
        L12_2 = 255
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        return
      end
    end
  end
  L1_2 = tasers
  L1_2 = L1_2[A0_2]
  L1_2 = L1_2.loadedCartridges
  if 2 == L1_2 then
    L1_2 = L0_1
    if "left" == L1_2 then
      L1_2 = L1_1
      if not L1_2 then
        L1_2 = DrawSprite
        L2_2 = "cid"
        L3_2 = "LeftCartridgeSafetyOff"
        L4_2 = main
        L4_2 = L4_2.cidXY
        L4_2 = L4_2[1]
        L5_2 = main
        L5_2 = L5_2.cidXY
        L5_2 = L5_2[2]
        L6_2 = 0.125
        L7_2 = 0.125
        L8_2 = 0.0
        L9_2 = 255
        L10_2 = 255
        L11_2 = 255
        L12_2 = 255
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        return
      end
    end
  end
  L1_2 = tasers
  L1_2 = L1_2[A0_2]
  L1_2 = L1_2.loadedCartridges
  if 2 == L1_2 then
    L1_2 = L0_1
    if "right" == L1_2 then
      L1_2 = L1_1
      if L1_2 then
        L1_2 = DrawSprite
        L2_2 = "cid"
        L3_2 = "RightCartridgeSafetyOn"
        L4_2 = main
        L4_2 = L4_2.cidXY
        L4_2 = L4_2[1]
        L5_2 = main
        L5_2 = L5_2.cidXY
        L5_2 = L5_2[2]
        L6_2 = 0.125
        L7_2 = 0.125
        L8_2 = 0.0
        L9_2 = 255
        L10_2 = 255
        L11_2 = 255
        L12_2 = 255
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        return
      end
    end
  end
  L1_2 = tasers
  L1_2 = L1_2[A0_2]
  L1_2 = L1_2.loadedCartridges
  if 2 == L1_2 then
    L1_2 = L0_1
    if "right" == L1_2 then
      L1_2 = L1_1
      if not L1_2 then
        L1_2 = DrawSprite
        L2_2 = "cid"
        L3_2 = "RightCartridgeSafetyOff"
        L4_2 = main
        L4_2 = L4_2.cidXY
        L4_2 = L4_2[1]
        L5_2 = main
        L5_2 = L5_2.cidXY
        L5_2 = L5_2[2]
        L6_2 = 0.125
        L7_2 = 0.125
        L8_2 = 0.0
        L9_2 = 255
        L10_2 = 255
        L11_2 = 255
        L12_2 = 255
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        return
      end
    end
  end
  L1_2 = tasers
  L1_2 = L1_2[A0_2]
  L1_2 = L1_2.loadedCartridges
  if 0 == L1_2 then
    L1_2 = L0_1
    if nil == L1_2 then
      L1_2 = L1_1
      if L1_2 then
        L1_2 = DrawSprite
        L2_2 = "cid"
        L3_2 = "BothCartridgesUsedSafetyOn"
        L4_2 = main
        L4_2 = L4_2.cidXY
        L4_2 = L4_2[1]
        L5_2 = main
        L5_2 = L5_2.cidXY
        L5_2 = L5_2[2]
        L6_2 = 0.125
        L7_2 = 0.125
        L8_2 = 0.0
        L9_2 = 255
        L10_2 = 255
        L11_2 = 255
        L12_2 = 255
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        return
      end
    end
  end
  L1_2 = tasers
  L1_2 = L1_2[A0_2]
  L1_2 = L1_2.loadedCartridges
  if 0 == L1_2 then
    L1_2 = L0_1
    if nil == L1_2 then
      L1_2 = L1_1
      if not L1_2 then
        L1_2 = DrawSprite
        L2_2 = "cid"
        L3_2 = "BothCartridgesUsedSafetyOff"
        L4_2 = main
        L4_2 = L4_2.cidXY
        L4_2 = L4_2[1]
        L5_2 = main
        L5_2 = L5_2.cidXY
        L5_2 = L5_2[2]
        L6_2 = 0.125
        L7_2 = 0.125
        L8_2 = 0.0
        L9_2 = 255
        L10_2 = 255
        L11_2 = 255
        L12_2 = 255
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        return
      end
    end
  end
end
renderUI = L15_1
L15_1 = RegisterKeyMapping
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.toggleTorch
L17_1 = main
L17_1 = L17_1.commands
L17_1 = L17_1.toggleTorchDescription
L18_1 = "keyboard"
L19_1 = main
L19_1 = L19_1.enableFlashlight
L15_1(L16_1, L17_1, L18_1, L19_1)
L15_1 = RegisterCommand
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.toggleTorch
function L17_1()
  local L0_2, L1_2
  L0_2 = L8_1
  L0_2 = not L0_2
  L8_1 = L0_2
end
L15_1(L16_1, L17_1)
function L15_1(A0_2)
  local L1_2
  L8_1 = A0_2
end
enableFlash = L15_1
L15_1 = RegisterKeyMapping
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.toggleLaser
L17_1 = main
L17_1 = L17_1.commands
L17_1 = L17_1.toggleLaserDescription
L18_1 = "keyboard"
L19_1 = main
L19_1 = L19_1.enableLaserSight
L15_1(L16_1, L17_1, L18_1, L19_1)
L15_1 = RegisterCommand
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.toggleLaser
function L17_1()
  local L0_2, L1_2
  L0_2 = L7_1
  L0_2 = not L0_2
  L7_1 = L0_2
end
L15_1(L16_1, L17_1)
function L15_1(A0_2)
  local L1_2
  L7_1 = A0_2
end
enableLaser = L15_1
L15_1 = RegisterKeyMapping
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.toggleSafety
L17_1 = main
L17_1 = L17_1.commands
L17_1 = L17_1.toggleSafetyDescription
L18_1 = "keyboard"
L19_1 = main
L19_1 = L19_1.enableSafety
L15_1(L16_1, L17_1, L18_1, L19_1)
L15_1 = RegisterCommand
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.toggleSafety
function L17_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2 = not L0_2
  L1_1 = L0_2
  L0_2 = safetyToggled
  L1_2 = L1_1
  L0_2(L1_2)
end
L15_1(L16_1, L17_1)
function L15_1(A0_2)
  local L1_2
  L1_1 = A0_2
end
enableSafety = L15_1
L15_1 = RegisterKeyMapping
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.selectRightCartridge
L17_1 = main
L17_1 = L17_1.commands
L17_1 = L17_1.selectRightCartridgeDescription
L18_1 = "keyboard"
L19_1 = main
L19_1 = L19_1.selectRightCartridge
L15_1(L16_1, L17_1, L18_1, L19_1)
L15_1 = RegisterCommand
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.selectRightCartridge
function L17_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = L5_1
  if not L0_2 then
    L0_2 = tasers
    L1_2 = weapon
    L0_2 = L0_2[L1_2]
    if nil ~= L0_2 then
      L0_2 = L2_1
      if L0_2 then
        L0_2 = tasers
        L1_2 = weapon
        L0_2 = L0_2[L1_2]
        L0_2 = L0_2.ableToReactivate
        if L0_2 then
          L0_2 = "right"
          L10_1 = L0_2
          L0_2 = TriggerServerEvent
          L1_2 = "TaserFramework:TaseEntity"
          L2_2 = weapon
          L3_2 = L10_1
          L4_2 = tasers
          L5_2 = weapon
          L4_2 = L4_2[L5_2]
          L4_2 = L4_2.loadedCartridges
          L0_2(L1_2, L2_2, L3_2, L4_2)
          L0_2 = true
          L5_1 = L0_2
          L0_2 = Citizen
          L0_2 = L0_2.SetTimeout
          L1_2 = main
          L1_2 = L1_2.cartridgeReactivationCooldown
          L1_2 = L1_2 * 1000
          function L2_2()
            local L0_3, L1_3
            L0_3 = false
            L5_1 = L0_3
          end
          L0_2(L1_2, L2_2)
      end
      else
        L0_2 = L0_1
        if "left" ~= L0_2 then
          L0_2 = L0_1
          if nil ~= L0_2 then
            goto lbl_48
          end
        end
        L0_2 = "right"
        L0_1 = L0_2
      end
    end
  end
  ::lbl_48::
end
L15_1(L16_1, L17_1)
L15_1 = RegisterKeyMapping
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.reloadTaserKey
L17_1 = main
L17_1 = L17_1.commands
L17_1 = L17_1.reloadTaserKeyDescription
L18_1 = "keyboard"
L19_1 = main
L19_1 = L19_1.reloadTaser
L15_1(L16_1, L17_1, L18_1, L19_1)
L15_1 = RegisterCommand
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.reloadTaserKey
function L17_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = main
  L0_2 = L0_2.framework
  L0_2 = L0_2.standalone
  if L0_2 then
    L0_2 = ExecuteCommand
    L1_2 = "reloadtaser"
    L0_2(L1_2)
  else
    L0_2 = TriggerServerEvent
    L1_2 = "TaserFramework:ReloadTaser"
    L2_2 = GetPlayerServerId
    L3_2 = PlayerId
    L3_2 = L3_2()
    L2_2, L3_2 = L2_2(L3_2)
    L0_2(L1_2, L2_2, L3_2)
  end
end
L15_1(L16_1, L17_1)
L15_1 = RegisterKeyMapping
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.selectLeftCartridge
L17_1 = main
L17_1 = L17_1.commands
L17_1 = L17_1.selectLeftCartridgeDescription
L18_1 = "keyboard"
L19_1 = main
L19_1 = L19_1.selectLeftCartridge
L15_1(L16_1, L17_1, L18_1, L19_1)
L15_1 = RegisterCommand
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.selectLeftCartridge
function L17_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = L4_1
  if not L0_2 then
    L0_2 = tasers
    L1_2 = weapon
    L0_2 = L0_2[L1_2]
    if nil ~= L0_2 then
      L0_2 = L3_1
      if L0_2 then
        L0_2 = tasers
        L1_2 = weapon
        L0_2 = L0_2[L1_2]
        L0_2 = L0_2.ableToReactivate
        if L0_2 then
          L0_2 = "left"
          L10_1 = L0_2
          L0_2 = TriggerServerEvent
          L1_2 = "TaserFramework:TaseEntity"
          L2_2 = weapon
          L3_2 = L10_1
          L4_2 = tasers
          L5_2 = weapon
          L4_2 = L4_2[L5_2]
          L4_2 = L4_2.loadedCartridges
          L5_2 = L0_1
          L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
          L0_2 = true
          L4_1 = L0_2
          L0_2 = Citizen
          L0_2 = L0_2.SetTimeout
          L1_2 = main
          L1_2 = L1_2.cartridgeReactivationCooldown
          L1_2 = L1_2 * 1000
          function L2_2()
            local L0_3, L1_3
            L0_3 = false
            L4_1 = L0_3
          end
          L0_2(L1_2, L2_2)
      end
      else
        L0_2 = L0_1
        if "right" ~= L0_2 then
          L0_2 = L0_1
          if nil ~= L0_2 then
            goto lbl_49
          end
        end
        L0_2 = "left"
        L0_1 = L0_2
      end
    end
  end
  ::lbl_49::
end
L15_1(L16_1, L17_1)
L15_1 = RegisterKeyMapping
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.driveStun
L17_1 = main
L17_1 = L17_1.commands
L17_1 = L17_1.driveStunDescription
L18_1 = "keyboard"
L19_1 = main
L19_1 = L19_1.enableArcMode
L15_1(L16_1, L17_1, L18_1, L19_1)
L15_1 = RegisterCommand
L16_1 = main
L16_1 = L16_1.commands
L16_1 = L16_1.driveStun
function L17_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = L6_1
  if not L0_2 then
    L0_2 = L1_1
    if not L0_2 then
      L0_2 = tasers
      L1_2 = weapon
      L0_2 = L0_2[L1_2]
      if nil ~= L0_2 then
        L0_2 = IsPlayerFreeAiming
        L1_2 = PlayerId
        L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L1_2()
        L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
        if L0_2 then
          L0_2 = true
          L6_1 = L0_2
          L0_2 = Citizen
          L0_2 = L0_2.SetTimeout
          L1_2 = main
          L1_2 = L1_2.driveStunCooldown
          L1_2 = L1_2 * 1000
          function L2_2()
            local L0_3, L1_3
            L0_3 = false
            L6_1 = L0_3
          end
          L0_2(L1_2, L2_2)
          L0_2 = GetClosestPlayer
          L1_2 = main
          L1_2 = L1_2.arcModeRange
          L0_2 = L0_2(L1_2)
          L1_2 = GetEntityCoords
          L2_2 = ped
          L1_2 = L1_2(L2_2)
          L2_2 = TriggerServerEvent
          L3_2 = "TaserFramework:playAudio"
          L4_2 = L1_2
          L5_2 = "./arcsound.ogg"
          L2_2(L3_2, L4_2, L5_2)
          if L0_2 then
            L2_2 = GetPlayerServerId
            L3_2 = L0_2
            L2_2 = L2_2(L3_2)
            L3_2 = TriggerServerEvent
            L4_2 = "TaserFramework:ArcTase"
            L5_2 = L2_2
            L6_2 = weapon
            L7_2 = tasers
            L8_2 = weapon
            L7_2 = L7_2[L8_2]
            L7_2 = L7_2.loadedCartridges
            L8_2 = true
            L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
          else
            L2_2 = GetClosestNPC
            L3_2 = main
            L3_2 = L3_2.arcModeRange
            L2_2 = L2_2(L3_2)
            if nil ~= L2_2 then
              L3_2 = NetworkGetNetworkIdFromEntity
              L4_2 = L2_2
              L3_2 = L3_2(L4_2)
              L4_2 = TriggerServerEvent
              L5_2 = "TaserFramework:ArcTase"
              L6_2 = L3_2
              L7_2 = weapon
              L8_2 = tasers
              L9_2 = weapon
              L8_2 = L8_2[L9_2]
              L8_2 = L8_2.loadedCartridges
              L9_2 = false
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
            end
          end
        end
      end
    end
  end
end
L15_1(L16_1, L17_1)
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L8_1
  if L1_2 then
    L1_2 = IsPlayerFreeAiming
    L2_2 = PlayerId
    L2_2, L3_2, L4_2, L5_2 = L2_2()
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    if L1_2 then
      L1_2 = L11_1
      if not L1_2 then
        L1_2 = SetTimeout
        L2_2 = 200
        function L3_2()
          local L0_3, L1_3, L2_3, L3_3
          L0_3 = DecorSetBool
          L1_3 = A0_2
          L2_3 = "TaserTorch"
          L3_3 = true
          L0_3(L1_3, L2_3, L3_3)
          L0_3 = true
          L11_1 = L0_3
        end
        L1_2(L2_2, L3_2)
      end
    else
      L1_2 = L11_1
      if L1_2 then
        L1_2 = DecorSetBool
        L2_2 = A0_2
        L3_2 = "TaserTorch"
        L4_2 = false
        L1_2(L2_2, L3_2, L4_2)
        L1_2 = false
        L11_1 = L1_2
      end
    end
  else
    L1_2 = L11_1
    if L1_2 then
      L1_2 = DecorSetBool
      L2_2 = A0_2
      L3_2 = "TaserTorch"
      L4_2 = false
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = false
      L11_1 = L1_2
    end
  end
  L1_2 = L7_1
  if L1_2 then
    L1_2 = IsPlayerFreeAiming
    L2_2 = PlayerId
    L2_2, L3_2, L4_2, L5_2 = L2_2()
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    if L1_2 then
      L1_2 = SetTimeout
      L2_2 = 200
      function L3_2()
        local L0_3, L1_3, L2_3, L3_3
        L0_3 = L12_1
        if not L0_3 then
          L0_3 = Wait
          L1_3 = 200
          L0_3(L1_3)
          L0_3 = DecorSetBool
          L1_3 = A0_2
          L2_3 = "TaserLaser"
          L3_3 = true
          L0_3(L1_3, L2_3, L3_3)
          L0_3 = true
          L12_1 = L0_3
        end
      end
      L1_2(L2_2, L3_2)
      L1_2 = L12_1
      if L1_2 then
        L1_2 = GetGameplayCamRot
        L1_2 = L1_2()
        L2_2 = DecorSetFloat
        L3_2 = A0_2
        L4_2 = "TaserLaserX"
        L5_2 = L1_2.x
        L2_2(L3_2, L4_2, L5_2)
        L2_2 = DecorSetFloat
        L3_2 = A0_2
        L4_2 = "TaserLaserY"
        L5_2 = L1_2.y
        L2_2(L3_2, L4_2, L5_2)
        L2_2 = DecorSetFloat
        L3_2 = A0_2
        L4_2 = "TaserLaserZ"
        L5_2 = L1_2.z
        L2_2(L3_2, L4_2, L5_2)
      end
    else
      L1_2 = L12_1
      if L1_2 then
        L1_2 = DecorSetBool
        L2_2 = A0_2
        L3_2 = "TaserLaser"
        L4_2 = false
        L1_2(L2_2, L3_2, L4_2)
        L1_2 = false
        L12_1 = L1_2
      end
    end
  else
    L1_2 = L12_1
    if L1_2 then
      L1_2 = DecorSetBool
      L2_2 = A0_2
      L3_2 = "TaserLaser"
      L4_2 = false
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = false
      L12_1 = L1_2
    end
  end
end
EnableDisableDecors = L15_1
function L15_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = {}
  L4_2 = math
  L4_2 = L4_2.pi
  L4_2 = L4_2 / 180
  L4_2 = L4_2 * A0_2
  L3_2.x = L4_2
  L4_2 = math
  L4_2 = L4_2.pi
  L4_2 = L4_2 / 180
  L4_2 = L4_2 * A1_2
  L3_2.y = L4_2
  L4_2 = math
  L4_2 = L4_2.pi
  L4_2 = L4_2 / 180
  L4_2 = L4_2 * A2_2
  L3_2.z = L4_2
  L4_2 = {}
  L5_2 = math
  L5_2 = L5_2.sin
  L6_2 = L3_2.z
  L5_2 = L5_2(L6_2)
  L5_2 = -L5_2
  L6_2 = math
  L6_2 = L6_2.abs
  L7_2 = math
  L7_2 = L7_2.cos
  L8_2 = L3_2.x
  L7_2, L8_2 = L7_2(L8_2)
  L6_2 = L6_2(L7_2, L8_2)
  L5_2 = L5_2 * L6_2
  L4_2.x = L5_2
  L5_2 = math
  L5_2 = L5_2.cos
  L6_2 = L3_2.z
  L5_2 = L5_2(L6_2)
  L6_2 = math
  L6_2 = L6_2.abs
  L7_2 = math
  L7_2 = L7_2.cos
  L8_2 = L3_2.x
  L7_2, L8_2 = L7_2(L8_2)
  L6_2 = L6_2(L7_2, L8_2)
  L5_2 = L5_2 * L6_2
  L4_2.y = L5_2
  L5_2 = math
  L5_2 = L5_2.sin
  L6_2 = L3_2.x
  L5_2 = L5_2(L6_2)
  L4_2.z = L5_2
  return L4_2
end
RotationToDirection = L15_1
function L15_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L6_2 = DrawMarker
  L7_2 = 28
  L8_2 = A0_2.x
  L9_2 = A0_2.y
  L10_2 = A0_2.z
  L11_2 = 0.0
  L12_2 = 0.0
  L13_2 = 0.0
  L14_2 = 0.0
  L15_2 = 0.0
  L16_2 = 0.0
  L17_2 = A1_2
  L18_2 = A1_2
  L19_2 = A1_2
  L20_2 = A2_2
  L21_2 = A3_2
  L22_2 = A4_2
  L23_2 = A5_2
  L24_2 = false
  L25_2 = false
  L26_2 = 2
  L27_2 = nil
  L28_2 = nil
  L29_2 = false
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
end
DrawSphere2 = L15_1
function L15_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = RotationToDirection
  L4_2 = DecorGetFloat
  L5_2 = A2_2
  L6_2 = "TaserLaserX"
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = DecorGetFloat
  L6_2 = A2_2
  L7_2 = "TaserLaserY"
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = DecorGetFloat
  L7_2 = A2_2
  L8_2 = "TaserLaserZ"
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L6_2(L7_2, L8_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L4_2 = {}
  L5_2 = A0_2.x
  L6_2 = L3_2.x
  L6_2 = L6_2 * A1_2
  L5_2 = L5_2 + L6_2
  L4_2.x = L5_2
  L5_2 = A0_2.y
  L6_2 = L3_2.y
  L6_2 = L6_2 * A1_2
  L5_2 = L5_2 + L6_2
  L4_2.y = L5_2
  L5_2 = A0_2.z
  L6_2 = L3_2.z
  L6_2 = L6_2 * A1_2
  L5_2 = L5_2 + L6_2
  L4_2.z = L5_2
  L5_2 = GetShapeTestResult
  L6_2 = StartShapeTestRay
  L7_2 = A0_2.x
  L8_2 = A0_2.y
  L9_2 = A0_2.z
  L10_2 = L4_2.x
  L11_2 = L4_2.y
  L12_2 = L4_2.z
  L13_2 = -1
  L14_2 = A2_2
  L15_2 = 1
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L10_2 = L6_2
  L11_2 = L7_2
  return L10_2, L11_2
end
RayCastPed = L15_1
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = GetActivePlayers
  L1_2 = L1_2()
  L2_2 = -1
  L3_2 = -1
  L4_2 = ped
  L5_2 = GetEntityCoords
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = ipairs
  L7_2 = L1_2
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = GetPlayerPed
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if L12_2 ~= L4_2 then
      L13_2 = GetEntityCoords
      L14_2 = L12_2
      L13_2 = L13_2(L14_2)
      L14_2 = L13_2 - L5_2
      L14_2 = #L14_2
      if -1 == L2_2 or L2_2 > L14_2 then
        L3_2 = L11_2
        L2_2 = L14_2
      end
    end
  end
  if -1 ~= L2_2 and A0_2 >= L2_2 then
    return L3_2
  else
    L6_2 = nil
    return L6_2
  end
end
GetClosestPlayer = L15_1
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = 0
  L2_2 = 1000
  L3_2 = ped
  L4_2 = GetEntityCoords
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = EnumeratePeds
  L5_2, L6_2, L7_2, L8_2 = L5_2()
  for L9_2 in L5_2, L6_2, L7_2, L8_2 do
    L10_2 = GetEntityCoords
    L11_2 = L9_2
    L10_2 = L10_2(L11_2)
    L10_2 = L4_2 - L10_2
    L10_2 = #L10_2
    if L2_2 >= L10_2 and L9_2 ~= L3_2 then
      L1_2 = L9_2
      L2_2 = L10_2
    end
  end
  if A0_2 >= L2_2 then
    return L1_2
  end
  L5_2 = nil
  return L5_2
end
GetClosestNPC = L15_1

Config = {}

Config.RemoveTimeProKit = 3000 -- How much time it will save if using Pro version of cleaning kit
Config.RemoveTimePhyton = 2000 -- How much it will save if using (having) Phyton in player's inventory
Config.RemoveTimeOil = 2000 -- How much it will save if using (having) Oil in player's inventory


Config.TimeIfBellow30 = 30000 -- How much cleaning will take if gun's wear is < 30
Config.TimeIfAbove30 = 25000 -- How much cleaning will take if gun's wear is > 30
Config.TimeIfBellow60 = 20000 -- How much cleaning will take if gun's wear is < 60
Config.TimeIfBellow90 = 10000 -- How much cleaning will take if gun's wear is < 90

Config.InteractSound = true -- If you're using Interact sound (https://github.com/plunkettscott/interact-sound)
Config.CleaningSounds = true
Config.ISVolumeJam = 0.5 -- Interact sound volume for jam
Config.ISVolumeCleaning = 0.3 -- Interact sound volume for Cleaning
Config.Debug = true


Config.SkillBar = false -- setting this to false, will disable cleaning sound
Config.SkillBarType = 'ox' -- Options: 'ox', 'qb', 'custom'
Config.ProgressBar = true -- setting this to false, will isable cleaning sound
Config.ProgressBarType = 'ox' -- Options: 'ox', 'qb', 'custom'

Config.Framework = 'qb' -- 'esx' or 'qb'
Config.Inventory = 'ox' -- ox/qb/qs

Config.JamType1SkillLevels = {'easy', 'easy', 'easy'}
Config.JamType2SkillLevels = {'easy', 'medium', 'easy'}
Config.JamType3SkillLevels = {'easy', 'hard', 'easy'}

Config.VersionCheck = true

-- Jamming System

Config.ignoredWeaponHashes = { -- Weapons that will not jam.
    [GetHashKey("weapon_grenade")] = true,
    [GetHashKey("weapon_bzgas")] = true,
    [GetHashKey("weapon_molotov")] = true,
    [GetHashKey("weapon_stickybomb")] = true,
    [GetHashKey("weapon_proxmine")] = true,
    [GetHashKey("weapon_snowball")] = true,
    [GetHashKey("weapon_pipebomb")] = true,
    [GetHashKey("weapon_ball")] = true,
    [GetHashKey("weapon_smokegrenade")] = true,
    [GetHashKey("weapon_flare")] = true,
    [GetHashKey("weapon_acidpackage")] = true,
    [GetHashKey("weapon_petrolcan")] = true,
    [GetHashKey("gadget_parachute")] = true,
    [GetHashKey("weapon_fireextinguisher")] = true,
    [GetHashKey("weapon_hazardcan")] = true,
    [GetHashKey("weapon_fertilizercan")] = true,
    [GetHashKey("weapon_rpg")] = true,
    [GetHashKey("weapon_grenadelauncher")] = true,
    [GetHashKey("weapon_grenadelauncher_smoke")] = true,
    [GetHashKey("weapon_minigun")] = true,
    [GetHashKey("weapon_firework")] = true,
    [GetHashKey("weapon_railgun")] = true,
    [GetHashKey("weapon_hominglauncher")] = true,
    [GetHashKey("weapon_compactlauncher")] = true,
    [GetHashKey("weapon_rayminigun")] = true,
    [GetHashKey("weapon_emplauncher")] = true,
    [GetHashKey("weapon_railgunxm3")] = true,
}
Config.EnableSpecificWeaponModifier = true

Config.SpecificWeaponModifier = {
    [GetHashKey("weapon_snspistol")] = 2,
    [GetHashKey("weapon_combatpistol")] = 2,
    [GetHashKey("weapon_pistol")] = 2,
}


Config.JamChangeAbove95 = 0.1
Config.JamChangeAbove90 = 0.2
Config.JamChangeAbove60 =  0.3
Config.JamChangeAbove50 =  0.5
Config.JamChangeAbove40 =  1.7
Config.JamChangeAbove30 = 3.8
Config.JamChangeBellow30 = 10.9


Config.JamType1Max = 3000 -- How much time at maximum will first jam take
Config.JamType1Min = 1000 -- How much time at minimum will first jam take

Config.JamType2Max = 5000 -- How much time at maximum will second jam take
Config.JamType2Min = 3000 -- How much time at minimum will second jam take

Config.JamType3Max = 7000 -- How much time at maximum will third jam take
Config.JamType3Min = 5000 -- How much time at minimum will third jam take

-- Notify System

local ESX = nil
local QBCore = nil

if Config.Framework == 'esx' then
    ESX = exports["es_extended"]:getSharedObject()
else 
    QBCore = exports['qb-core']:GetCoreObject()
end
    
function NotifyError(text)
    if Config.Framework == 'esx' then
        lib.notify({
            id = 'some_identifier',
            title = 'Weapons',
            description = text,
            position = 'top',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
                ['.description'] = {
                color = '#909296'
                }
            },
            icon = 'triangle-exclamation',
            iconColor = '#C53030'
        })
    else
        QBCore.Functions.Notify({text = 'Weapons', caption = text}, 'error', 5000)
    end
end

function Notify(text)
    if Config.Framework == 'esx' then
        lib.notify({
            title = 'Weapons',
            description = text,
            type = 'info'
        })
    else
        QBCore.Functions.Notify({text = 'Weapons', caption = text}, 'error', 5000)
    end
end

-- exports['Domas_GunMaintenance']:FixWeapon() -- Fixes current weapon (clears the jam)
-- exports['Domas_GunMaintenance']:IsWeaponJammed() -- Check if current weapon is jammed

Config.Text = {
    ['no_weapon'] = 'I think I need to hold a weapon',
    ['canceled'] = 'You cancelled the weapon cleaning',
    ['half_cleaned'] = 'You partially cleaned the weapon',
    ['full_clean'] = 'You fully cleaned the weapon',
    ['weapon_jammed'] = 'Gun jammed! Press [E] to fix it',
    ['CanceledFixing'] = 'You canceled fixing',
    ['PrepairingToClean'] = 'Preparing',


    -- Weapon issues causes:

    ['weapon_jammed1'] = 'Replugging magazine',
    ['weapon_jammed2'] = 'Clearing ejection port',
    ['weapon_jammed3'] = 'Clearing the chamber'
}

-- For my Lithuanian brothers

--[[
    Config.Text = {
    ['no_weapon'] = 'Manau man reikėtų laikyti ginklą',
    ['canceled'] = 'Atšaukėte ginklo valymą',
    ['half_cleaned'] = 'Pusiau išvalėte ginklą',
    ['full_clean'] = 'Pilnai išvalėte ginklą',
    ['weapon_jammed'] = 'Ginklas užstrigo! Spausk [E] norėdamas jį atstrigdinti',
    ['CanceledFixing'] = 'Atšaukei strigimo tvarkymą',
    ['PrepairingToClean'] = 'Pasiruoši valymui',


    -- Weapon issues causes:

    ['weapon_jammed1'] = 'Pertrauki spyną',
    ['weapon_jammed2'] = 'Krapštai įtrigusią tūtą uokse',
    ['weapon_jammed3'] = 'Krapštai įtrigusią tūtą šovinio lizde'
}

]]

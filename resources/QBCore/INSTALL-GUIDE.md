##### STEP 1 ##### 
# Dependencies

# You need to download them MANDATORY

# Polyzone         : https://github.com/mkafrin/PolyZone
# xSound           : https://github.com/Xogy/xsound
# Screenshot-basic : https://github.com/citizenfx/screenshot-basic
# Webpacks         : https://github.com/citizenfx/cfx-server-data/tree/master/resources

Ignore if already have
https://github.com/qbcore-framework/qb-menu
https://github.com/qbcore-framework/qb-input

##### STEP 2 #####
# DELETE OLD SQL `(If you do not do this step you will have errors)`
You have to execute the SQL of the file called : `STEP-1.sql`.

##### STEP 3 #####
# ADD SQL ON PLAYERS
You have to execute the SQL of the file called : `STEP-2.sql`.

##### STEP 3 #####
# ADD GENERAL SQL
You have to execute the SQL of the file called : `STEP-3.sql`.

##### STEP 4 #####
# ADD THE ITEMS
Go to `qb-core/shared/items.lua` at the end of the file, `COPY and PASTE` the items into the file called `BEFORE-INSTALL\QBCore\STEP-4\items.lua`.

If you have `ox-inventory` 
go to `BEFORE-INSTALL\QBCore\STEP-4\ox_inventory.lua` and add on your `ox_inventory/data/items.lua`

##### STEP 5 #####
# START RESOURCES
Go to your `server.cfg` and start the resources AFTER your `qb-core`, we recommend starting them after all scripts!

ensure PolyZone
ensure xsound
ensure screenshot-basic
ensure smartphone_props
ensure qs-videos
ensure qs-smartphone    

# DELETE THE `qs-base` FILE THAT'S ONLY FOR ESX

##### STEP 6 #####
# CONFIGURE THE SCRIPT

Go to `qs-smartphone/config/config.lua`, in line 34 change `esx` to `qb`. It has to look like this : `Config.Framework = "qb" -- 'esx' or 'qb'`

Go to `qs-smartphone/server/custom/webhooks/webhooks.lua` and add your Webhooks, if you don't know how watch this video : `https://www.youtube.com/watch?v=e0m6_WuNFmI`

Go to `qs-videos/config/config.js` and add your webhook for videos.

##### STEP 7 #####
# FINAL STEP 

Before starting your server, clear your server's cache and start it again. Once this is done, wait for it to start and restart it again. If you don't know how to do this watch this video:
`https://youtu.be/uN9wT-28kf8?t=128`

# For more information read the complete documentation: `https://docs.quasar-store.com/qbcore/smartphone/installations`

# For the modifications in your QBCore scripts read this: `https://docs.quasar-store.com/qbcore/smartphone/modifications`
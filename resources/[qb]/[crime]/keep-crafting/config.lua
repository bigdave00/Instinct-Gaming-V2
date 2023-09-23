Config = Config or {}

Config.menu = 'qb-menu' -- keep-menu (recommended) / qb-menu

Config.model_loading = {
     timeout = 1500, --ms
     dealy = 50,     --ms
}

Config.MagicTouch = true

Config.categories = {
     ['misc'] = {
          key = 'misc',
          label = 'Misc',
          icon = 'fa-solid fa-tags',
          jobs = {},
     },
     ['weapons'] = {
          key = 'weapons',
          label = 'Weapons',
          icon = 'fa-solid fa-gun',
          jobs = {},
          sub_categories = {
               ['tools'] = {
                    label = 'Tools',
               },
               ['pistol'] = {
                    label = 'Pistol',
               },
               ['smg'] = {
                    label = 'SMG',
               },
          }
     },
     ['medical'] = {
          key = 'medical',
          label = 'Medical',
          icon = 'fa-solid fa-hand-holding-medical',
          jobs = {}
     },
     ['blueprints'] = {
          key = 'blueprints',
          label = 'Blueprints Craft',
          icon = 'fa-solid fa-file',
          jobs = {}
     },
}

Config.permanent_items = {
     ['weapon_wrench'] = true
}

local misc_recipe = {
     ['repairkit'] = {
          categories = {
               main = 'misc',
          },
          item_settings = {
               label = 'Repair kit',
               -- icon = 'fa-solid fa-gun',
               object = {
                    name = 'prop_tool_box_04', -- <-- this model can fail to load
                    rotation = vector3(45.0, 0.0, -45.0)
               },
               image = 'repairkit', -- use inventory's images
               level = 40,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["metalscrap"] = 20,
                    ["steel"] = 25,
               },
               exp_per_craft = 20
          }
     },
     ['radio'] = {
          categories = {
               main = 'misc',
          },
          item_settings = {
               label = 'Radio',
               image = 'radio', -- use inventory's images
               object = {
                    name = 'v_serv_radio',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 0,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 60,
               materials = {
                    ["steel"] = 5,
                    ["plastic"] = 5,
               },
               exp_per_craft = 5
          }
     },
     ['lockpick'] = {
          categories = {
               main = 'misc',
          },
          item_settings = {
               label = 'Lockpick',
               image = 'lockpick', -- use inventory's images
               object = {
                    name = 'prop_tool_screwdvr01',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 0,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    -- ["steel"] = 20,
                    -- ["rubber"] = 20,
                    ["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
}

local medial = {
     ['bandage'] = {
          categories = {
               main = 'medical',
          },
          item_settings = {
               label = 'Bandage',
               image = 'bandage', -- use inventory's images
               level = 125,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },
               -- gang = {
               --      allowed_list = {},
               --      allowed_grades = {}
               -- }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 3,
               materials = {
                    ["plastic"] = 1,
               },
               exp_per_craft = 5
          }
     },
}

local weapons_recipe = {
     ['weapon_handcuffs'] = {
          categories = {
               sub = 'tools',
          },
          item_settings = {
               label = 'Handcuffs',
               image = 'weapon_handcuffs', -- use inventory's images
               object = {
                    name = 'p_cs_cuffs_02_s',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 50,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 30,
               },
               exp_per_craft = 5
          }
     },
     ['drill'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'Drill',
               image = 'drill', -- use inventory's images
               object = {
                    name = 'prop_tool_drill',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['gasmask'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'Gas Mask',
               image = 'gasmask', -- use inventory's images
               object = {
                    name = 'prop_player_gasmask',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['key1'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'Key 1',
               image = 'key1', -- use inventory's images
               object = {
                    name = 'prop_cs_keys_01',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['methkey'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'Key A',
               image = 'methkey', -- use inventory's images
               object = {
                    name = 'prop_cs_keys_01',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['cocainekey'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'Key B',
               image = 'cocainekey', -- use inventory's images
               object = {
                    name = 'prop_cs_keys_01',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['weedkey'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'Key C',
               image = 'weedkey', -- use inventory's images
               object = {
                    name = 'prop_cs_keys_01',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['key2'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'Key 2',
               image = 'key2', -- use inventory's images
               object = {
                    name = 'prop_cs_keys_01',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['cutter'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'Cutter',
               image = 'cutter', -- use inventory's images
               object = {
                    name = 'h4_prop_h4_cutter_01a',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['bag'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'bag',
               image = 'bag', -- use inventory's images
               object = {
                    name = 'v_ind_rc_workbag',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['weapon_switchblade'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'SwitchBlade',
               image = 'weapon_switchblade', -- use inventory's images
               object = {
                    name = 'w_me_switchblade',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['weapon_bzgas'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'BZGas',
               image = 'weapon_bzgas', -- use inventory's images
               object = {
                    name = 'v_ind_cs_gascanister',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['thermite'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'thermite',
               image = 'thermite', -- use inventory's images
               object = {
                    name = 'hei_prop_heist_thermite',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['c4_bomb'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'C4 Bomb',
               image = 'c4_bomb', -- use inventory's images
               object = {
                    name = 'hei_prop_heist_thermite',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['laptop'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'Laptop',
               image = 'laptop', -- use inventory's images
               object = {
                    name = 'xm_prop_x17_laptop_lester_01',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['trojan_usb'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'Trojan USB',
               image = 'trojan_usb', -- use inventory's images
               object = {
                    name = 'tr_prop_tr_usb_drive_01a',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 5,
               materials = {
                    ["steel"] = 20,
                     ["rubber"] = 20,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['cokebaggy'] = {
          categories = {
               main = 'tools',
          },
          item_settings = {
               label = 'Coke Bag',
               image = 'cokebaggy', -- use inventory's images
               object = {
                    name = 'tr_prop_tr_usb_drive_01a',
                    rotation = vector3(0.0, 0.0, 0.0)
               },
               level = 10,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               },

          },
          crafting = {
               show_level_in_mail = true,
               success_rate = 100,
               amount = 80, -- crafted amount
               duration = 5,
               materials = {
                    ["empty_weed_bag"] = 1,
                     ["coke_brick"] = 1,
                    --["weapon_wrench"] = 1,
               },
               exp_per_craft = 5
          }
     },
     ['pistol_ammo'] = {
          categories = {
               sub = 'pistol',
          },
          item_settings = {
               label = 'Pistol ammo',
               image = 'pistol_ammo', -- use inventory's images
               object = {
                    name = 'prop_ld_ammo_pack_01',
                    rotation = vector3(250.0, 0.0, 0.0)
               },
               level = 60,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 30,
               materials = {
                    ["steel"] = 30,
               },
               exp_per_craft = 5
          }
     },
     ['weapon_pistol'] = {
          categories = {
               sub = 'pistol',
          },
          item_settings = {
               label = 'Walther P99',
               image = 'weapon_pistol', -- use inventory's images
               object = {
                    name = 'w_pi_pistol50',
                    rotation = vector3(45.0, 0.0, 0.0)
               },
               level = 120,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 260,
               materials = {
                    ["aluminum"] = 80,
                    ["steel"] = 70,
                    ["rubber"] = 30,
               },
               exp_per_craft = 30
          }
     },
     ['weapon_combatpistol'] = {
          categories = {
               sub = 'pistol',
          },
          item_settings = {
               label = 'Combat Pistol',
               image = 'weapon_combatpistol', -- use inventory's images
               object = {
                    name = 'w_pi_combatpistol',
                    rotation = vector3(45.0, 0.0, 0.0)
               },
               level = 200,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 260,
               materials = {
                    ["aluminum"] = 100,
                    ["steel"] = 90,
                    ["rubber"] = 50,
               },
               exp_per_craft = 40
          }
     },
     ['weapon_pistol50'] = {
          categories = {
               sub = 'pistol',
          },
          item_settings = {
               label = '50Cal Pistol',
               image = 'weapon_pistol50', -- use inventory's images
               object = {
                    name = 'w_pi_combatpistol',
                    rotation = vector3(45.0, 0.0, 0.0)
               },
               level = 650,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 260,
               materials = {
                    ["aluminum"] = 100,
                    ["steel"] = 90,
                    ["rubber"] = 50,
               },
               exp_per_craft = 40
          }
     },
     ['pistol_suppressor'] = {
          categories = {
               sub = 'smg',
          },
          item_settings = {
               label = 'Pistol suppressor',
               image = 'pistol_suppressor', -- use inventory's images
               object = {
                    name = 'w_at_ar_supp_02',
                    rotation = vector3(45.0, 0.0, 0.0)
               },
               level = 5,
               hide_until_reaches_level = true,
               job = {
                    allowed_list = {},
                    allowed_grades = {}
               }
          },
          crafting = {
               success_rate = 100,
               amount = 1, -- crafted amount
               duration = 260,
               materials = {
                    ["metalscrap"] = 50,
                    ["steel"] = 60,
                    ["rubber"] = 30,
               },
               exp_per_craft = 5
          }
     },
}

Config.workbench_default_model = 'gr_prop_gr_bench_04a'

Config.workbenches = {
     -- -- items
     {
          table_model = "gr_prop_gr_bench_04b",
          coords = vector3(1346.55, 4391.04, 43.36),
          item_show_case_offset = vector3(0.0, 0.0, 1.3),
          rotation = vector3(0.0, 0.0, 350),
          -- just use either job or gang using both at same time won't work.
          job = {
               allowed_list = {},
               allowed_grades = {}
          },
          -- gang = {
          --      allowed_list = { 'ballas' },
          --      allowed_grades = { ['ballas'] = { 1, 2, 3, 4 } }
          -- },
          categories = { Config.categories.blueprints, Config.categories.misc, Config.categories.medical, Config.categories.weapons },
          recipes = { weapons_recipe, misc_recipe, medial },
          radius = 3.0
     },
     {
          table_model = 'gr_prop_gr_bench_04b',
          coords = vector3(-59.5, 6388.77, 30.49),
          rotation = vector3(0.0, 0.0, 225.0),
          job = {
               allowed_list = {},
               allowed_grades = {}
          },
          categories = { Config.categories.blueprints, Config.categories.misc, Config.categories.medical, Config.categories.weapons },
          recipes = { weapons_recipe, misc_recipe, medial },
          radius = 3.0
     },
     {
          table_model = 'gr_prop_gr_bench_02b',
          coords = vector3(2939.04, 4623.81, 47.72),
          item_show_case_offset = vector3(0.0, 0.0, 1.2),
          rotation = vector3(0, 0, 0),
          gang = {
               allowed_list = { 'ballas' },
               allowed_grades = { ['ballas'] = { 1, 2, 3, 4 } }
          },
          categories = { Config.categories.weapons },
          recipes = { weapons_recipe },
          radius = 3.0
     },
     {
          table_model = 'gr_prop_gr_bench_02b',
          coords = vector3(-1540.785, 100.131, 55.78),
          item_show_case_offset = vector3(0.0, 0.0, 1.2),
          rotation = vector3(0.0, 0.0, 235),
          gang = {
               allowed_list = { 'thecartel' },
               allowed_grades = { ['thecartel'] = { 1, 2, 3, 4 } }
          },
          categories = { Config.categories.blueprints, Config.categories.misc, Config.categories.medical, Config.categories.weapons },
          recipes = { weapons_recipe, misc_recipe, medial },
          radius = 3.0
     },
     {
          table_model = 'gr_prop_gr_bench_02b',
          coords = vector3(-316.839, -1348.084, 30.054),
          item_show_case_offset = vector3(0.0, 0.0, 1.2),
          rotation = vector3(0.0, 0.0, 0.0),
          gang = {
               allowed_list = { 'iyt' },
               allowed_grades = { ['iyt'] = { 1, 2, 3, 4 } }
          },
          categories = { Config.categories.blueprints, Config.categories.misc, Config.categories.medical, Config.categories.weapons },
          recipes = { weapons_recipe, misc_recipe, medial },
          radius = 3.0
     },
     {
          table_model = 'gr_prop_gr_bench_02b',
          coords = vector3(-1520.451, 80.404, 55.668),
          item_show_case_offset = vector3(0.0, 0.0, 1.2),
          rotation = vector3(0.0, 0.0, 190.0),
          gang = {
               allowed_list = { 'thecartel' },
               allowed_grades = { ['thecartel'] = { 1, 2, 3, 4 } }
          },
          categories = { Config.categories.blueprints, Config.categories.misc, Config.categories.medical, Config.categories.weapons },
          recipes = { weapons_recipe, misc_recipe, medial },
          radius = 3.0
     },
     {
          table_model = 'gr_prop_gr_bench_02b',
          coords = vector3(103.085, -1985.982, 19.754),
          item_show_case_offset = vector3(0.0, 0.0, 1.2),
          rotation = vector3(0.0, 0.0, 195.0),
          gang = {
               allowed_list = {},
               allowed_grades = {}
          },
          categories = { Config.categories.blueprints, Config.categories.misc, Config.categories.medical, Config.categories.weapons },
          recipes = { weapons_recipe, misc_recipe, medial },
          radius = 3.0
     },
}

--gr_prop_gr_jailer_keys_01a
 --vector3(-1520.451, 80.404, 56.168) --[vector4(-1520.451, 80.404, 56.168, 190.0)]--
-- gr_prop_gr_missle_long
-- gr_prop_gr_missle_short
-- gr_int02_generator_01
-- gr_prop_gr_hammer_01

-- w_sr_heavysnipermk2_mag2
-- w_sb_smgmk2_mag2
-- w_sb_smgmk2_mag1
-- w_pi_pistolmk2_mag1
-- w_mg_combatmgmk2_mag1
-- w_ar_carbineriflemk2_mag1
-- w_ar_assaultriflemk2_mag1
-- w_ex_vehiclemissile_3
-- w_ex_vehiclemissile_1
-- w_ex_vehiclemissile_2
-- w_ex_vehiclemortar

-- w_sg_pumpshotgunmk2_mag1
-- w_sg_pumpshotgunh4_mag1
-- gr_prop_gr_adv_case

-- w_at_pi_flsh_2
-- w_at_afgrip_2
-- w_at_muzzle_1
-- w_at_muzzle_3
-- w_at_muzzle_2
-- w_at_muzzle_5
-- w_at_muzzle_6
-- w_at_muzzle_7
-- w_at_muzzle_8
-- w_at_muzzle_9

-- w_at_pi_comp_1
-- w_at_pi_rail_1
-- w_at_scope_macro_2_mk2
-- w_at_scope_small_mk2
-- w_at_scope_medium_2
-- w_at_scope_nv
-- w_at_sights_1
-- w_at_sights_smg
-- w_at_sr_supp3


-- gr_prop_gr_drill_01a

-- gr_prop_gr_driver_01a
-- gr_prop_gr_pliers_01
-- gr_prop_gr_pliers_02
-- gr_prop_gr_rasp_01
-- gr_prop_gr_rasp_02
-- gr_prop_gr_rasp_03
-- gr_prop_gr_sdriver_01
-- gr_prop_gr_sdriver_02
-- gr_prop_gr_sdriver_03

-- gr_prop_gr_vice_01a

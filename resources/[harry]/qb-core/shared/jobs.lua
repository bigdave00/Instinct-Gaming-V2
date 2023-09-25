QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.QBJobsStatus = false -- true: integrate qb-jobs into the whole of qb-core | false: treat qb-jobs as an add-on resource.
QBShared.Jobs = {} -- All of below has been migrated into qb-jobs
if QBShared.QBJobsStatus then return end
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Universal Credit', payment = 25 },
        },
	},
	['police'] = {
		label = 'Metropolitan Police',
        type = "leo",
		defaultDuty = false,
		offDutyPay = false,
        grades = {
            ['0'] = { name = 'Student Constable', payment = 1000 },
			['1'] = { name = 'Police Constable', payment = 1100 },
			['2'] = { name = 'Probationary Sergeant', payment = 1200 },
			['3'] = { name = 'Sergeant', payment = 1300 },
			['4'] = { name = 'Inspector', payment = 1400 },
            ['5'] = { name = 'Chief Inspector', payment = 1500 },
            ['6'] = { name = 'Superintendent', payment = 1600 },
            ['7'] = { name = 'Chief Superintendent', payment = 1700 },
            ['8'] = { name = 'Commander', payment = 1800 },
            ['9'] = { name = 'Assistant Deputy Commissioner', isboss = true, payment = 1900 },
            ['10'] = { name = 'Assistant Commissioner', isboss = true, payment = 2000 },
            ['11'] = { name = 'Deputy Commissioner', isboss = true, payment = 2100 },
            ['12'] = { name = 'Commissioner', isboss = true, payment = 2200 },

        },
	},
    ['firefighter'] = {
        label = 'The London Fire Brigade',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 500 },
			['1'] = { name = 'Operator', payment = 600 },
			['2'] = { name = 'Company Officer', payment = 700 },
			['3'] = { name = 'Chief', isboss = true, payment = 1000 },
        },
    },
	['ambulance'] = {
		label = 'NHS',
        type = 'ems',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
                ['0'] = { name = 'Student Paramedic', payment = 500 },
                ['1'] = { name = 'Paramedic', payment = 600 },
                ['2'] = { name = 'Junior Doctor', payment = 600 },
                ['3'] = { name = 'Advanced Paramedic', payment = 700 },
                ['4'] = { name = 'Doctor', payment = 700 },
                ['5'] = { name = 'Rapid Response Paramedic', payment = 700 },
                ['6'] = { name = 'HART Paramedic', payment = 700 },
                ['7'] = { name = 'HEMS Paramedic', payment = 700 },
                ['8'] = { name = 'Senior Paramedic', payment = 800 },
                ['9'] = { name = 'Surgeon', payment = 800 },
                ['10'] = { name = 'Rapid Response Specialist', payment = 800 },
                ['11'] = { name = 'HART Specialist', payment = 800 },
                ['12'] = { name = 'HEMS Specialist ', payment = 800 },
                ['13'] = { name = 'Unit Lead', payment = 1000 },
                ['14'] = { name = 'DCMO', isboss = true, payment = 1200 },
                ['15'] = { name = 'CMO', isboss = true, payment = 1400 },
        },
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 75 },
			['1'] = { name = 'Employee', payment = 75 },
			['2'] = { name = 'Estate Manager', isboss = true, payment = 150 },
        },
	},
    ['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
	['mechanic'] = {
        label = 'IG Mechanic Shop',
		defaultDuty = false,
		offDutyPay = true,
        grades = {
            ['0'] = { name = 'Apprentice', payment = 100 },
			['1'] = { name = 'Mechanic', payment = 200 },
			['2'] = { name = 'Vehicle Sales', payment = 300 },
			['3'] = { name = 'Manager', isboss = true, payment = 400 },
			['4'] = { name = 'CEO', isboss = true, payment = 500 },
        },
    },
	['justice'] = {
		label = 'Ministry of Justice',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
            ['0'] = { name = 'Intern', payment = 50 },
			['1'] = { name = 'Solicitor', payment = 75 },
			['2'] = { name = 'Prosecution', payment = 100 },
			['3'] = { name = 'Circuit Judge', payment = 125 },
            ['4'] = { name = 'Justice of the Supreme Court', isboss = true, payment = 150 },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
			['0'] = { name = 'Intern', payment = 50 },
			['1'] = { name = 'Solicitor', payment = 75 },
			['2'] = { name = 'Prosecution', payment = 100 },
			['3'] = { name = 'Boss', payment = 125 },
            ['4'] = { name = 'CEO', isboss = true, payment = 150 },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = { name = 'Taxi Driver', payment = 50 },
        },
	},
    ['miner'] = {
		label = 'Miner',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = { name = 'Miner', payment = 50 },
		},
	},  
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = { name = 'BBC News', payment = 50 },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = { name = 'Trucker', payment = 50 },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = { name = 'Towing', payment = 50 },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = { name = 'Garbage Collector', payment = 50 },
        },
	},
    ['lumberjack'] = {
		label = 'LumberJack',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = { name = 'Wood', payment = 50 },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = true,
		grades = {
            ['0'] = { name = 'hotdog sales', payment = 50 },
        },
	},
	['postup'] = {
		label = 'Post Up',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = { name = 'Driver', payment = 50 },
        },
	},

    -- Business 
    ['burgershot'] = {
		label = 'BurgerShot',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
    ["pizzathis"] = {
        label = 'Pizza This',
		defaultDuty = false,
		offDutyPay = true,
        grades = {
            ['0'] = { name = 'Employee', payment = 50 },
			['1'] = { name = 'Employee', payment = 75 },
			['2'] = { name = 'Manager', payment = 100 },
			['3'] = { name = 'Owner', isboss = true, payment = 125 },
        },
    },
    ['beanmachine'] = {
		label = 'Bean Machine',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Coffee Grinder', payment = 50 },
			['1'] = { name = 'Barista ', payment = 75 },
			['2'] = { name = 'Supervisor ', payment = 100 },
			['3'] = { name = 'Assistant Manager', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
    ['uwu'] = {
		label = 'Cat Cafe',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
    ['popsdiner'] = {
		label = 'Pops Diner',
		defaultDuty = false,
		offDutyPay = true,
        grades = {
            ['0'] = { name = 'Employee', payment = 50 },
			['1'] = { name = 'Employee', payment = 75 },
			['2'] = { name = 'Manager', payment = 100 },
			['3'] = { name = 'Owner', isboss = true, payment = 125 },
        },
	},
    ['tuner'] = {
        label = '6STR Tuner Shop',
		defaultDuty = false,
		offDutyPay = true,
        grades = {
            ['0'] = { name = 'Apprentice', payment = 50 },
			['1'] = { name = 'Mechanic', payment = 75 },
			['2'] = { name = 'Vehicle Sales', payment = 100 },
			['3'] = { name = 'Manager', isboss = true, payment = 125 },
			['4'] = { name = 'CEO', isboss = true, payment = 150 },
        },
    },
	['bankmanager'] = {
        label = 'IG Bank Manager',
		defaultDuty = true,
		offDutyPay = false,
        grades = {
			['1'] = { name = 'Employee', payment = 500 },
			['2'] = { name = 'CEO', isboss = true, payment = 1000 },
        },
    },
    ['hookah'] = {
        label = 'Hookah Lounge',
		defaultDuty = false,
		offDutyPay = true,
        grades = {
            ['0'] = { name = 'Apprentice', payment = 50 },
			['1'] = { name = 'Employee', payment = 75 },
			['2'] = { name = 'Assistant Manager', payment = 100 },
			['3'] = { name = 'Manager', isboss = true, payment = 125 },
			['4'] = { name = 'CEO', isboss = true, payment = 150 },
        },
    },
    ['vanilla'] = {
		label = 'Vanilla Unicorn',
		defaultDuty = true,
		offDutyPay = false,
            grades = {
                ['0'] = { name = 'Bar Tender', payment = 50 },
                ['1'] = { name = 'Bar Tender Advanced', payment = 75 },
                ['2'] = { name = 'Assistant Manager', payment = 100 },
                ['3'] = { name = 'Boss', isboss = true, payment = 125 },
                ['4'] = { name = 'CEO', isboss = true, payment = 150 },
            },
        },
 
    ['casino'] = {
        label = 'Diamond Casino',
		defaultDuty = true,
		offDutyPay = true,
        grades = {
            ['0'] = { name = 'Employee', payment = 50 },
			['1'] = { name = 'Employee', payment = 75 },
			['2'] = { name = 'Boss', isboss = true, payment = 125 },
        },
	}, 
	['bahama'] = {
        label = 'bahama mamas',
		defaultDuty = true,
		offDutyPay = true,
        grades = {
            ['0'] = { name = 'Employee', payment = 50 },
			['1'] = { name = 'Employee', payment = 75 },
			['2'] = { name = 'Boss', isboss = true, payment = 125 },
        },
	}, 
	['whitewidow'] = {
        label = 'White Widow',
		defaultDuty = true,
		offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 50 },
			['1'] = { name = 'Deliveries', payment = 75 },
			['2'] = { name = 'Sales', payment = 100 },
			['3'] = { name = 'Grower', payment = 125 },
			['4'] = { name = 'Assistant Manager', payment = 150 },
			['5'] = { name = 'Manager', isboss = true, payment = 175 },
			['6'] = { name = 'Owner', isboss = true, payment = 200 },
        },
    }, 
}

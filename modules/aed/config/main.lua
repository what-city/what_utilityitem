--- @type table<string, What.Configuration.Aed>
CONFIG_AED = {
    ['aed'] = {
        duration  = 12000,
        health    = 150,
        remove    = false
    },
    ['aed_area']   = {
        duration   = 7500,
        area       = 15.0,
        health     = 180,
        remove     = true,
        progress   = {
            label  = 'กำลังใช้งาน Aed Area'
        },
        usableJobs = {
            all    = false,
            list   = {
                ambulance = {
                    all   = false,
                    [0]   = true,
                    [1]   = true
                },
                police    = {
                    all   = true
                }
            }
        }
    }
}

--- @type table<string, string>
CONFIG_AED_MESSAGES = {
    PED_IS_IN_ANY_VEHICLE   = 'ไม่สามารถชุบบนยานพาหนะได้',
    TARGET_IS_ALIVE         = 'ผู้เล่นยังมีชีวิตอยู่',
    REVIVE_IN_PROGRESS      = 'กำลังชุบผู้เล่น'
}
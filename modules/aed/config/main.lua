--- @type table<string, What.Configuration.Aed>
CONFIG_AED = {
    ['aed'] = {
        duration  = 12000,
        health    = 150,
        remove    = false
    },
    ['aed_area']  = {
        duration  = 7500,
        area      = 15.0,
        health    = 180,
        remove    = true,
        progress  = {
            label = 'กำลังใช้งาน Aed Area'
        }
    }
}
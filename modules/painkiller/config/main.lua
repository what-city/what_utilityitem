--- @type table<string, What.Configuration.Painkiller>
CONFIG_PAINKILLER = {
    ['painkiller'] = {
        duration  = 3000,
        remove    = true,
        health    = 40,
        prop      = {
            name  = 'prop_ld_health_pack'
        }
    },
    ['painkiller_without_prop'] = {
        duration  = 3000,
        remove    = true,
        health    = 40
    }
}
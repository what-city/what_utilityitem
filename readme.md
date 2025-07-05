
# What Utility Items

FiveM Utility Items
- AED 
- Bandage
- Painkiller
- ETC.


## Usage (configuration)

Aed

```lua
CONFIG_AED = {
    ['itemName']  = {
        duration  = 12000,  -- Milliseconds 
        health    = 150,    -- Add health after revive | 0 - 200
        remove    = false,  -- Remove item after use | true | false
        area      = 10.0,   -- Set this for area revive
        progress  = {       -- [Optional]
            label = 'Revive in progress'
        },
        usableJobs = {      -- [Optional]
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
```
    

Painkiller

```lua
CONFIG_PAINKILLER = {
    ['itemName'] = {
        duration = 12000,   -- Milliseconds 
        health   = 40,      -- Add Ped health after use
        remove   = true,    -- Remove item after use | true | false
        prop     = {        -- [Optional]
            name = 'prop_ld_health_pack'
        },
        usableJobs = {      -- [Optional]
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
```

Armor

```lua
CONFIG_ARMOR = {
    ['itemName'] = {
        duration = 12000,   -- Milliseconds 
        armor    = 40,      -- Add Ped armor after use
        remove   = true,    -- Remove item after use | true | false
        ,
        usableJobs = {      -- [Optional]
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
```

## Requirements
- [es_extended](https://docs.esx-framework.org/en)
- [ox_lib](https://overextended.dev/ox_lib)
- [mythic_progbar](https://github.com/TaemuruTempest/mythic_progbar)

## Support

For support
- [@Discord](http://discord.gg/HTpBuFXhUy)

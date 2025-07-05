
# What Utility Items

Current Version : 1.1.2

FiveM Utility Items
- AED 
- Bandage
- Painkiller
- ETC.

## Features
- **Painkiller**: สามารถปรับแต่ง Model Prop ได้
- **AED (Automated External Defibrillator)**: สามารถปรับแต่งข้อความ Progress ได้
- **AED, Armor, Painkiller**: สามารถตั้งค่าเงื่อนไขการใช้งานได้ (จะมีอาชีพและไอเทม)
  - กำหนดอาชีพเฉพาะและสามารถเลือกเกรดที่ต้องการได้
  - กำหนดไอเทมที่ต้องมีภายในกระเป๋าและกำหนดจำนวนขั้นต่ำได้

- **Painkiller**: Customizable Model Properties
- **AED (Automated External Defibrillator)**: Customizable Progress Text
- **AED, Armor, Painkiller**: Configurable Usage Conditions
  - Specify exclusive professions and required grades.
  - Define required items in the inventory and their minimum quantities.

## Usage (Configuration)

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
            all    = false, -- If true, list = {} is no need
            list   = {
                ambulance = {
                    all   = false, -- If true, [0] = true, [1]... is no need
                    [0]   = true,
                    [1]   = true
                },
                police    = {
                    all   = true
                }
            }
        },
        usableWhenHasAnyItem = { -- [Optional]
            ['gang_card']    = 1 -- Needed gang_card at least 1
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
            all    = false, -- If true, list = {} is no need
            list   = {
                ambulance = {
                    all   = false, -- If true, [0] = true, [1]... is no need
                    [0]   = true,
                    [1]   = true
                },
                police    = {
                    all   = true
                }
            }
        },
        usableWhenHasAnyItem = { -- [Optional]
            ['gang_card']    = 1 -- Needed gang_card at least 1
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
        usableJobs = {      -- [Optional]
            all    = false, -- If true, list = {} is no need
            list   = {
                ambulance = {
                    all   = false, -- If true, [0] = true, [1]... is no need
                    [0]   = true,
                    [1]   = true
                },
                police    = {
                    all   = true
                }
            }
        },
        usableWhenHasAnyItem = { -- [Optional]
            ['gang_card']    = 1 -- Needed gang_card at least 1
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

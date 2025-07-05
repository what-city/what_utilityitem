
# What Utility Items (1.1.2)

FiveM Utility Items
- AED 
- Bandage
- Painkiller
- Armor

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

## Basic Usage (วิธีการตั้งค่าพื้นฐาน)

**Aed**

```lua
CONFIG_AED = {
    ['itemName']  = {
        duration  = 12000,  -- Milliseconds                                     หน่วยวินาที
        health    = 150,    -- Add health after revive | 0 - 200                จำนวนเลือดที่จะตั้งหลังจาก Spawned
        remove    = false,  -- Remove item after use | true | false             ลบไอเทมหลังใช้งานหรือไม่
        area      = 10.0,   -- Set this for area revive                         ให้ชุบชีวิตผู้เล่นที่อยู่ในระยะหรือไม่
        progress  = {       -- [Optional]                                       ปรับแต่ง Progress Bar
            label = 'Revive in progress'
        },
        usableJobs = {      -- [Optional]                                       ตั้งค่าอาชีพที่ใช้งานได้
            all    = false, -- If true, list = {...} is no need                 ถ้าหากปรับเป็น true, list = {...} จะไม่จำเป็นต้องมี
            list   = {
                ambulance = {
                    all   = false, -- If true, [0] = true, [1]... is no need    ถ้าหากปรับเป็น true, [0] = true, [1]... จะไม่จำเป็นต้องมี
                    [0]   = true,
                    [1]   = true
                },
                police    = {
                    all   = true
                }
            }
        },
        usableWhenHasAnyItem = { -- [Optional]                                  กำหนดไอเทมที่ต้องมีภายในกระเป๋าเพื่อใช้งาน
            ['gang_card']    = 1 -- Needed gang_card at least 1                 กำหนดชื่อไอเทม = จำนวนขั้นต่ำ
        }
    }
}
```
    

**Painkiller**

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

**Armor**

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

## Requirements (ความต้องการของระบบ)
- [es_extended](https://docs.esx-framework.org/en)
- [ox_lib](https://overextended.dev/ox_lib)
- [mythic_progbar](https://github.com/TaemuruTempest/mythic_progbar)

## Support

For support
- [@Discord](http://discord.gg/HTpBuFXhUy)

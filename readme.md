
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
    ["itemName"]  = {
        duration  = 12000,  -- Milliseconds 
        health    = 150,    -- Add health after revive | 0 - 200
        remove    = false,  -- Remove item after use | true | false
        area      = 10.0,   -- Set this for area revive
        progress  = { -- [Optional]
            label = 'Revive in progress'
        }
    }
}
```
    

Painkiller

```lua
CONFIG_PAINKILLER = {
    ["itemName"] = {
        duration = 12000, -- Milliseconds 
        health   = 40,    -- Add Ped health after use
        remove   = true,  -- Remove item after use | true | false
    }
}
```
    

## Support

For support
- [@Discord](http://discord.gg/HTpBuFXhUy)

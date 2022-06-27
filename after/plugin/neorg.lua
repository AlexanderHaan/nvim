require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/notes/work",
                    home = "~/notes/home",
                }
            }
        },
        ["core.norg.concealer"] = {},
        ["core.gtd.base"] = {
            config = {
                workspace = "work"
            }
        },
        ["core.keybinds"] = {
            config = {
                hook = function(keybinds)
                    keybinds.remap_event("norg", "n", "gntc", "core.gtd.base.capture")
                    keybinds.remap_event("norg", "n", "gntv", "core.gtd.base.views")
                    keybinds.remap_event("norg", "n", "gnte", "core.gtd.base.edit")
                end
            }
        }
    }
}

return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        
        dashboard.section.header.val = {
            [[                               __                 ]],
            [[  ___     ___    ___   __  __ /\_\    ___ ___     ]],
            [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\   ]],
            [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \  ]],
            [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\ ]],
            [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/ ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "  New file", "<cmd>ene<CR>"),
            dashboard.button("SPC t", "  Open explorer", "<cmd>NvimTreeToggle<CR>"),

            dashboard.button("SPC ff", "󰱽  Find file", "<cmd>Telescope find_files<CR>"),
            dashboard.button("SPC fs", "󰍉  Find word", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("q", "󰗼  Quit nvim", "<cmd>qa<CR>"),
        }

        dashboard.config.layout = {
            {type="padding", val=2},
            dashboard.section.header,
            {type="padding", val=2},
            dashboard.section.buttons,
            {type="padding", val=2},
            dashboard.section.footer,
        }

        dashboard.section.buttons.opts.spacing = 0

        alpha.setup(dashboard.opts)

        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

    end,
}

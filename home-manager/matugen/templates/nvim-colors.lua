return {
    {
        "ellisonleao/gruvbox.nvim",
        dependencies = { "nvim-lualine/lualine.nvim" },
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                contrast = "hard",
                palette_overrides = {
                    dark0_hard = "{{colors.surface.default.hex}}",
                },
            })

            local custom_gruvbox = require("lualine.themes.gruvbox")
            custom_gruvbox = {
                normal = {
                    a = {
                        bg = "{{colors.primary.default.hex}}",
                        fg = "{{colors.on_primary.default.hex}}",
                        gui = "bold",
                    },
                    b = {
                        bg = "{{colors.surface_container_high.default.hex}}",
                        fg = "{{colors.on_surface.default.hex}}",
                    },
                    c = { bg = "{{colors.surface_container.default.hex}}", fg = "{{colors.on_surface.default.hex}}" },
                },
                insert = {
                    a = {
                        bg = "{{colors.tertiary.default.hex}}",
                        fg = "{{colors.on_tertiary.default.hex}}",
                        gui = "bold",
                    },
                    b = {
                        bg = "{{colors.surface_container_high.default.hex}}",
                        fg = "{{colors.on_surface.default.hex}}",
                    },
                    c = { bg = "{{colors.surface_container.default.hex}}", fg = "{{colors.on_surface.default.hex}}" },
                },
                visual = {
                    a = {
                        bg = "{{colors.secondary.default.hex}}",
                        fg = "{{colors.on_secondary.default.hex}}",
                        gui = "bold",
                    },
                    b = {
                        bg = "{{colors.surface_container_high.default.hex}}",
                        fg = "{{colors.on_surface.default.hex}}",
                    },
                    c = { bg = "{{colors.surface_container.default.hex}}", fg = "{{colors.on_surface.default.hex}}" },
                },
                replace = {
                    a = {
                        bg = "{{colors.error.default.hex}}",
                        fg = "{{colors.on_error.default.hex}}",
                        gui = "bold",
                    },
                    b = {
                        bg = "{{colors.surface_container_high.default.hex}}",
                        fg = "{{colors.on_surface.default.hex}}",
                    },
                    c = { bg = "{{colors.surface_container.default.hex}}", fg = "{{colors.on_surface.default.hex}}" },
                },
                command = {
                    a = {
                        bg = "{{colors.primary.default.hex}}",
                        fg = "{{colors.on_primary.default.hex}}",
                        gui = "bold",
                    },
                    b = {
                        bg = "{{colors.surface_container_high.default.hex}}",
                        fg = "{{colors.on_surface.default.hex}}",
                    },
                    c = { bg = "{{colors.surface_container.default.hex}}", fg = "{{colors.on_surface.default.hex}}" },
                },
                inactive = {
                    a = {
                        bg = "{{colors.surface_container_high.default.hex}}",
                        fg = "{{colors.on_surface.default.hex}}",
                        gui = "bold",
                    },
                    b = {
                        bg = "{{colors.surface_container_high.default.hex}}",
                        fg = "{{colors.on_surface.default.hex}}",
                    },
                    c = { bg = "{{colors.surface_container.default.hex}}", fg = "{{colors.on_surface.default.hex}}" },
                },
            }
            custom_gruvbox.normal.c.bg = "{{colors.surface_container.default.hex}}"
            custom_gruvbox.normal.c.fg = "{{colors.on_surface.default.hex}}"

            require("lualine").setup({
                options = { theme = custom_gruvbox },
            })
            vim.cmd.colorscheme("gruvbox")
        end,
    },
}

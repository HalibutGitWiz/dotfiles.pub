local status_ok, lightbulb = pcall(require, "nvim-lightbulb")
if not status_ok then
    return
end

lightbulb.setup(
    {
        ignore = {},
        sign = {
            enabled = true,
            -- Priority of the gutter sign
            priority = 10,
        },
        float = {
            enabled = false,
            -- Text to show in the popup float
            text = " ",
            -- Available keys for window options:
            -- - height     of floating window
            -- - width      of floating window
            -- - wrap_at    character to wrap at for computing height
            -- - max_width  maximal width of floating window
            -- - max_height maximal height of floating window
            -- - pad_left   number of columns to pad contents at left
            -- - pad_right  number of columns to pad contents at right
            -- - pad_top    number of lines to pad contents at top
            -- - pad_bottom number of lines to pad contents at bottom
            -- - offset_x   x-axis offset of the floating window
            -- - offset_y   y-axis offset of the floating window
            -- - anchor     corner of float to place at the cursor (NW, NE, SW, SE)
            -- - winblend   transparency of the window (0-100)
            win_opts = {},
        },
        virtual_text = {
            enabled = false,
            -- Text to show at virtual text
            text = " ",
            -- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
            hl_mode = "replace",
        },
        status_text = {
            enabled = false,
            -- Text to provide when code actions are available
            text = " ",
            -- Text to provide when no actions are available
            text_unavailable = ""
        },
        autocmd = {
            enabled = true,
            -- see :help autocmd-pattern
            pattern = { "*" },
            -- see :help autocmd-events
            events = { "CursorHold", "CursorHoldI" }
        }
    }
)

-- Change the lightbulb sign (default one not working with Jetbrains font) and make it yellow
vim.cmd [[highlight LightbulbSignYellow guifg=yellow ctermfg=yellow]]
vim.fn.sign_define('LightBulbSign', { text = "", texthl = "LightbulbSignYellow" })

local is_windows = vim.fn.has("macunix") == false

-- Custom key maps/remaps/unmaps.
vim.keymap.set(
    {
        "i",
        "n"
    },
    "<C-c>",
    "<Nop>",
    {
        noremap = false,
        silent = true
    }
)

vim.keymap.set(
    "v",
    "<C-c>",
    "\"+ygv",
    {
        noremap = false,
        silent = true
    }
)

vim.keymap.set(
    "n",
    "x",
    "\"_x",
    {
        noremap = false,
        silent = true
    }
)

vim.keymap.set(
    "v",
    "<",
    "<gv",
    {
        noremap = false,
        silent = false
    }
)

vim.keymap.set(
    "v",
    ">",
    ">gv",
    {
        noremap = false,
        silent = false
    }
)


-- Misc options.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.expandtab = false
vim.opt.list = true
vim.opt.listchars = "tab:  ,trail:˽,extends:▶,precedes:◀,nbsp:↔"
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 8
vim.opt.softtabstop = 0
vim.opt.tabstop = 8
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.wrap = false

-- Options for inferior OS.
if is_windows then
	vim.opt.shell = "pwsh"
	vim.opt.shellcmdflag = "-command"
	vim.opt.shellquote = ""
	vim.opt.shellxquote = " "
end

-- Highlight characters on the 81st column.
vim.fn.matchadd("ColorColumn", "\\(\\%81v.\\)", 81)


-- Formatoptions.
vim.api.nvim_create_autocmd(
    {
        "VimEnter"
    },
    {
        pattern = {
            '*',
        },
        callback = function()
            vim.opt.formatoptions:remove("o")
            vim.opt.formatoptions:remove("r")
        end
    }
)


-- Colorscheme.
vim.api.nvim_cmd(
    {
        cmd = "colorscheme",
        args = {
            "wildcharm"
        }
    },
    {}
)


-- Syntax highlighting by file extension.
vim.filetype.add {
    extension = {
        ahk = "autohotkey_v2",
	gcode = "gcode",
	hx = "haxe",
        v = "verilog",
        vlg = "verilog",
        z80 = "z80"
    }
}


-- Restore the previous cursor position in a given file (when ShaDa doesn't work).
vim.api.nvim_create_autocmd(
    {
        "BufReadPost"
    },
    {
        callback = function()
            local buf = vim.api.nvim_get_current_buf()

            -- Don't do this for git-commit-buffers.
            if vim.tbl_contains({"gitcommit"}, vim.bo[buf].filetype)
            then
                return
            end

            local mark = vim.api.nvim_buf_get_mark(buf, "\"")
            local n_lines = vim.api.nvim_buf_line_count(buf)

            if mark[1] > 0 and mark[1] <= n_lines
            then
                pcall(vim.api.nvim_win_set_cursor, 0, mark)
                vim.api.nvim_feedkeys("zvzz", "n", true)
            end
        end
    }
)


-- Path to "lazy.nvim".
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"


-- Install Lazy if it's not installed
if not (vim.uv or vim.loop).fs_stat(lazy_path)
then
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazy_path 
    })

    if vim.v.shell_error ~= 0
    then
        vim.api.nvim_echo(
            {
                {
                    "Failed to clone lazy.nvim:\n",
                    "ErrorMsg"
                },
                {
                    out,
                    "WarningMsg"
                },
                {
                    "\nPress any key to exit..."
                },
            },
            true,
            {}
        )
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazy_path)


-- Lazy packages.
require("lazy").setup({
	-- GNU ARM assembly syntax highlighting.
	{
		"ARM9/arm-syntax-vim",
		init = function()
			vim.api.nvim_create_autocmd(
				{
					"VimEnter",
					"BufReadPost"
				},
				{
					pattern = {
						'*.arm.[sS]',
					},
					callback = function()
						vim.opt.filetype = "arm"
					end
				}
			)
		end
	},

	-- Treesitter.
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"html",
					"javascript",
					"lua",
					"python",
					"vim",
					"vimdoc"
				},
				sync_install = false,
				highlight = {
					enable = true
				},
				indent = {
					enable = true
				},
			})
		end
	},


	-- Live-preview (Live HTML preview).
	{
		'brianhuster/live-preview.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim'
		},
	}
})

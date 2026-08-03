vim.g.mapleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmd")


------------------------------------
--      UNINSTALL PLUGINS         --
------------------------------------
-- execute ":lua vim.pack.del({"name_of_the_plugin.nvim"})"
-- or ":lua vim.pack.update() and type gra on the inactive plugins to delete it"

vim.keymap.set('n', '<leader>op', function()
    vim.cmd('lua vim.pack.update(nil,{"offline = true"})')
    vim.notify('Press gra to delete unactive plugins.', vim.log.levels.INFO, { title = 'Plugin Manager' })
end, { desc = 'Packs Manager' })

vim.keymap.set("n", "<leader>oc", function()
    -- Gather all non-active plugin names
    local inactive_plugins = vim.iter(vim.pack.get())
        :filter(function(x) return not x.active end)
        :map(function(x) return x.spec.name end)
        :totable()

    -- Check if there is actually anything to delete
    if #inactive_plugins == 0 then
        vim.notify("No inactive plugins to remove!", vim.log.levels.INFO)
        return
    end

    -- Delete them from disk
    vim.pack.del(inactive_plugins)

    -- Notify you what was deleted
    vim.notify("Removed plugins: " .. table.concat(inactive_plugins, ", "), vim.log.levels.INFO)
end, { desc = "Clean inactive plugins" })


------------------------------------
-- AUTO CONFIG CHECKER FUNCTION   --
------------------------------------

-- Helper function to automatically require all files in a folder
local function auto_require(folder)
    -- Get the absolute system path to your nvim/lua/ directory
    local lua_path = vim.fn.stdpath("config") .. "/lua/"
    local target_dir = lua_path .. folder:gsub("%.", "/")

    -- Check if the directory actually exists before scanning
    if vim.uv.fs_stat(target_dir) then
        -- Scan the directory for files
        for name, type in vim.fs.dir(target_dir) do
            if type == "file" and name:match("%.lua$") then
                -- Strip the ".lua" extension to get the module name
                local plugin_name = name:sub(1, -5)
                -- Construct the full require path (e.g., "plugins.core.indent")
                local require_path = folder .. "." .. plugin_name

                -- Safely require the file
                pcall(require, require_path)
            end
        end
    end
end

-- Define a list of all folders you want to auto-load
local folders_to_load = {
    "plugins.core",
    "plugins.tools",
    "plugins.utility",
    "plugins.lsp",
    "plugins.colorscheme",
    "plugins.extra"
}

-- Loop through the list and require each one
for _, folder in ipairs(folders_to_load) do
    auto_require(folder)
end

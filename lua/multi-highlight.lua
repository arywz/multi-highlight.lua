local vim = vim
local M = {}

local group_table = {}

local default_conf = {
    groups = {'#88aa22', '#aa2222', '#22aa22', '#2222aa', '#B08020', '#FFA020', '#22aa22', '#8888ff'},
    keys = {
        ['<Space>m'] = {cmd='<cmd>lua require("multi-highlight").toggle_highlight()<cr>', mode = 'n', opt={}},
        ['<Space>M'] = {cmd='<cmd>lua require("multi-highlight").clear()<cr>', mode = 'n', opt={}}
    }
}

local function create_highlight_groups(conf)
    group_table = {}
    for index, group in ipairs(conf.groups) do
        local group_name = 'MultiHighlight_'..index
        local cmd = 'highlight '.. group_name .. ' guibg=' .. group
        table.insert(group_table, {group_name=group_name, word = nil, match_id=nil})
        vim.cmd(cmd)
    end
end

local function clear_highlight(item)
    vim.fn.matchdelete(item.match_id)
    item.word = nil
    item.match_id = nil
end

function M.setup (conf)
    if conf then
        conf = vim.tbl_extend('force', default_conf, conf)
    else
        conf = default_conf
    end
    create_highlight_groups(conf)
    for key, cmd_opt in pairs(conf.keys) do
        vim.api.nvim_set_keymap(cmd_opt.mode, key, cmd_opt.cmd, cmd_opt.opt)
    end
end

function M.toggle_highlight(target_word)
    local current_word = target_word or vim.fn.expand('<cword>')
    for _, item in ipairs(group_table) do
        if item.word and item.word == current_word then
            clear_highlight(item)
            return
        end
    end

    for _, item in ipairs(group_table) do
        if item.word == nil then
            item.match_id = vim.fn.matchadd(item.group_name, '\\<'..current_word..'\\>')
            item.word = current_word
            return
        end
    end
    vim.notify('ran out colors, total '..#group_table .. ' configured', vim.log.levels.WARN)
end

function M.clear()
    for _, item in ipairs(group_table) do
        if item.match_id then
            clear_highlight(item)
        end
    end
end

return M

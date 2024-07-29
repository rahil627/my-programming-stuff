-- TODO: this is just genereated boiler-plate code

-- Automated installation of vim-plug if not installed
if vim.fn.empty(vim.fn.glob('~/.local/share/nvim/site/autoload/plug.vim')) > 0 then
    vim.fn.system({'curl', '-fLo', '~/.local/share/nvim/site/autoload/plug.vim', '--create-dirs', 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
    vim.api.nvim_command('autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim')
end

-- Plugins using Packer.nvim
require('packer').startup(function()
    use 'junegunn/goyo.vim'
    use 'sonph/onehalf'
    -- ... other plugins ...
end)

-- Set options
vim.cmd('colorscheme onehalfdark')  -- Change colorscheme

-- Key mappings
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
-- ... other key mappings ...

-- Coc configuration (completion, etc.)
vim.g.coc_global_extensions = {
    {'coc-json', 'coc-html', 'coc-css', 'coc-tsserver'} -- Example of installing coc extensions
}

-- Other configurations
-- ...

-- Function to map the space key to the / search and Ctrl+space to ? search
function map_space_to_search()
    vim.api.nvim_set_keymap('n', '<Space>', '/', { noremap = true })
    vim.api.nvim_set_keymap('n', '<C-Space>', '?', { noremap = true })
end
map_space_to_search()

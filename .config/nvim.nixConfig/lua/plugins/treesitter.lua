-- Treesitter parser installation, highlighting, and indentation.

local gh = require('core.utils').gh

-- Install Treesitter using the newer main branch setup.
vim.pack.add({
  { src = gh('nvim-treesitter/nvim-treesitter'), version = 'main' },
})

-- Parsers to keep installed.
local parsers = {
  'bash',
  'c',
  'diff',
  'html',
  'css',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'vim',
  'vimdoc',
  'python',
  'javascript',
  'java',
  'dockerfile',
  'toml',
  'go',
  'gitignore',
  'yaml',
  'make',
  'cmake',
}

require('nvim-treesitter').install(parsers)

-- Attach highlighting and indentation for one buffer/language.
local function treesitter_try_attach(buf, language)
  if not vim.treesitter.language.add(language) then
    return
  end

  vim.treesitter.start(buf, language)

  local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil
  if has_indent_query then
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

local available_parsers = require('nvim-treesitter').get_available()

-- Start Treesitter automatically when a supported filetype opens.
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-attach', { clear = true }),
  callback = function(args)
    local buf = args.buf
    local filetype = args.match
    local language = vim.treesitter.language.get_lang(filetype)

    if not language then
      return
    end

    local installed_parsers = require('nvim-treesitter').get_installed('parsers')

    if vim.tbl_contains(installed_parsers, language) then
      treesitter_try_attach(buf, language)
    elseif vim.tbl_contains(available_parsers, language) then
      require('nvim-treesitter').install(language):await(function()
        treesitter_try_attach(buf, language)
      end)
    else
      treesitter_try_attach(buf, language)
    end
  end,
})

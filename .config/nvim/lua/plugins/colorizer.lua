vim.pack.add { 'https://github.com/catgoose/nvim-colorizer.lua' }

require('colorizer').setup {
  filetypes = { '*' },
  options = {
    parsers = {
      hex = {
        default = true,
        rgb = true,
        rgba = true,
        rrggbb = true,
        rrggbbaa = true,
      },
      rgb = { enable = true },
      hsl = { enable = true },
      tailwind = {
        enable = true,
      },
    },
    display = {
      mode = 'background',
    },
  },
}

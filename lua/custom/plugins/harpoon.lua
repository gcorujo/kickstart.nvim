return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('harpoon'):setup()
  end,
  keys = {
    {
      '<leader>I',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Harpoon File',
    },
    {
      '<leader>i',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'Harpoon Quick Menu',
    },
    {
      '<leader>j',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Harpoon to file 1',
    },
    {
      '<leader>k',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Harpoon to file 2',
    },
    {
      '<leader>l',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'Harpoon to file 3',
    },
  },
}

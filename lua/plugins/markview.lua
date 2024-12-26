return {
  'OXY2DEV/markview.nvim',
  lazy = false, -- Recommended
  -- ft = "markdown" -- If you decide to lazy-load anyway

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    headings = {
      enable = true,

      --- Amount of character to shift per heading level
      ---@type integer
      shift_width = 1,
      heading_1 = {
        style = 'label',

        --- Alignment of the heading.
        ---@type "left" | "center" | "right"
        align = 'left',

        --- Primary highlight group. Used by other
        --- options that end with "_hl" when their
        --- values are nil.
        ---@type string
        hl = 'MarkviewHeading1',

        --- Left corner, Added before the left padding
        ---@type string?
        ---corner_left = '',

        --- Left padding, Added before the icon
        ---@type string?

        ---padding_left = ' ',

        --- Right padding, Added after the heading text
        ---@type string?
        ---padding_right = ' ',

        --- Right corner, Added after the right padding
        ---@type string?
        ---corner_right = '',

        ---@type string?
        corner_left_hl = 'MarkviewHeading1Sign',
        ---@type string?
        padding_left_hl = nil,

        ---@type string?
        padding_right_hl = nil,
        ---@type string?
        corner_right_hl = 'MarkviewHeading1Sign',

        --- Text to show on the signcolumn.
        ---@type string?
        sign = '󰌕 ',

        --- Highlight group for the sign.
        ---@type string?
        sign_hl = 'MarkviewHeading1Sign',

        --- Icon to show before the heading text.
        ---@type string?
        icon = '',

        --- Highlight group for the Icon.
        ---@type string?

        icon_hl = 'MarkviewHeading1',
      },
      heading_2 = {
        style = 'label',

        --- Alignment of the heading.
        ---@type "left" | "center" | "right"
        align = 'left',

        --- Character used to shift/indent the heading
        ---@type string
        shift_char = ' ',

        --- Primary highlight group. Used by other
        --- options that end with "_hl" when their
        --- values are nil.
        ---@type string
        hl = 'MarkviewHeading2',

        --- Left corner, Added before the left padding
        ---@type string?
        ---corner_left = '',

        --- Left padding, Added before the icon
        ---@type string?

        ---padding_left = ' ',

        --- Right padding, Added after the heading text
        ---@type string?
        ---padding_right = ' ',

        --- Right corner, Added after the right padding
        ---@type string?
        ---corner_right = '',

        ---@type string?
        corner_left_hl = 'MarkviewHeading2Sign',
        ---@type string?
        padding_left_hl = nil,

        ---@type string?
        padding_right_hl = nil,
        ---@type string?
        corner_right_hl = 'MarkviewHeading2Sign',

        --- Text to show on the signcolumn.
        ---@type string?
        sign = '󰌕 ',

        --- Highlight group for the sign.
        ---@type string?
        sign_hl = 'MarkviewHeading2Sign',

        --- Icon to show before the heading text.
        ---@type string?
        icon = '',

        --- Highlight group for the Icon.
        ---@type string?

        icon_hl = 'MarkviewHeading2',
      },
      heading_3 = {
        style = 'label',

        --- Alignment of the heading.
        ---@type "left" | "center" | "right"
        align = 'left',

        --- Character used to shift/indent the heading
        ---@type string
        shift_char = '  ',

        --- Primary highlight group. Used by other
        --- options that end with "_hl" when their
        --- values are nil.
        ---@type string
        hl = 'MarkviewHeading3',

        --- Left corner, Added before the left padding
        ---@type string?
        ---corner_left = '',

        --- Left padding, Added before the icon
        ---@type string?

        ---padding_left = ' ',

        --- Right padding, Added after the heading text
        ---@type string?
        ---padding_right = ' ',

        --- Right corner, Added after the right padding
        ---@type string?
        ---corner_right = '',

        ---@type string?
        corner_left_hl = 'MarkviewHeading3Sign',
        ---@type string?
        padding_left_hl = nil,

        ---@type string?
        padding_right_hl = nil,
        ---@type string?
        corner_right_hl = 'MarkviewHeading3Sign',

        --- Text to show on the signcolumn.
        ---@type string?
        sign = '󰌕 ',

        --- Highlight group for the sign.
        ---@type string?
        sign_hl = 'MarkviewHeading3Sign',

        --- Icon to show before the heading text.
        ---@type string?
        icon = '',

        --- Highlight group for the Icon.
        ---@type string?

        icon_hl = 'MarkviewHeading3',
      },
      heading_4 = {
        style = 'label',

        --- Alignment of the heading.
        ---@type "left" | "center" | "right"
        align = 'left',

        --- Character used to shift/indent the heading
        ---@type string
        shift_char = '   ',

        --- Primary highlight group. Used by other
        --- options that end with "_hl" when their
        --- values are nil.
        ---@type string
        hl = 'MarkviewHeading4',

        --- Left corner, Added before the left padding
        ---@type string?
        ---corner_left = '',

        --- Left padding, Added before the icon
        ---@type string?

        ---padding_left = ' ',

        --- Right padding, Added after the heading text
        ---@type string?
        ---padding_right = ' ',

        --- Right corner, Added after the right padding
        ---@type string?
        ---corner_right = '',

        ---@type string?
        corner_left_hl = 'MarkviewHeading4Sign',
        ---@type string?
        padding_left_hl = nil,

        ---@type string?
        padding_right_hl = nil,
        ---@type string?
        corner_right_hl = 'MarkviewHeading4Sign',

        --- Text to show on the signcolumn.
        ---@type string?
        sign = '󰌕 ',

        --- Highlight group for the sign.
        ---@type string?
        sign_hl = 'MarkviewHeading4Sign',

        --- Icon to show before the heading text.
        ---@type string?
        icon = '',

        --- Highlight group for the Icon.
        ---@type string?

        icon_hl = 'MarkviewHeading4',
      },
    },
  },
}

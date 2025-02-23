require('mini.ai').setup()
require('mini.align').setup()
require('mini.comment').setup()
require('mini.operators').setup()
require('mini.splitjoin').setup()
require('mini.surround').setup({
	mappings = {
		add = '<C-s>a',      -- Add surrounding in Normal and Visual modes
		delete = '<C-s>d',   -- Delete surrounding
		find = '<C-s>f',     -- Find surrounding (to the right)
		find_left = '<C-s>F', -- Find surrounding (to the left)
		highlight = '<C-s>h', -- Highlight surrounding
		replace = '<C-s>r',  -- Replace surrounding
		update_n_lines = '<C-s>n', -- Update `n_lines`
	}
})

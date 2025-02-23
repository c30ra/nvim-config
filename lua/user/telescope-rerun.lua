-- ~/.config/nvim/lua/user/my_telescope.lua
local M = {}

local last_prompt = ""
local last_picker = nil

local function create_attach_mappings(existing_attach)
  return function(prompt_bufnr, map)
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    -- If the user or default telescope code had attach_mappings, call it first.
    if existing_attach then
      -- If that attach returns `false`, it stops further mappings from being set.
      local res = existing_attach(prompt_bufnr, map)
      if res == false then
        return false
      end
    end

    -- Capture typed prompt on <CR> (select_default) or when the picker closes.
    actions.select_default:enhance({
      post = function()
        last_prompt = action_state.get_current_line()
      end,
    })

    actions.close:enhance({
      post = function()
        last_prompt = action_state.get_current_line()
      end,
    })

    -- Return true so the default (and any already-set) mappings remain valid.
    return true
  end
end

--- Run a picker and remember it for repeat.
-- @param picker_fn function (e.g. require('telescope.builtin').live_grep)
-- @param opts table  (options for the picker, e.g. { hidden = true })
function M.run_picker(picker_fn, opts)
  if type(picker_fn) ~= "function" then
    vim.notify("run_picker: first argument must be a function!", vim.log.levels.ERROR)
    return
  end

  opts = opts or {}
  -- Wrap the user's existing attach_mappings (if any) to capture prompt text.
  opts.attach_mappings = create_attach_mappings(opts.attach_mappings)

  -- Remember this function + opts for later repetition
  last_picker = {
    fn   = picker_fn,
    opts = opts,
  }

  picker_fn(opts)
end

--- Repeat the last picker, injecting the last typed prompt into 'default_text'.
function M.repeat_last_picker()
  if not last_picker then
    vim.notify("No last picker found to repeat!", vim.log.levels.WARN)
    return
  end

  local fn   = last_picker.fn
  local opts = vim.deepcopy(last_picker.opts)

  -- Pre-fill the prompt with the last thing typed
  opts.default_text = last_prompt

  fn(opts)
end

return M

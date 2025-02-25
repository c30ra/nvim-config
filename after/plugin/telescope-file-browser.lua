require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      grouped = true,
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      -- mappings = {
      --   ["i"] = {
      --     -- your custom insert mode mappings
      --   },
      --   ["n"] = {
      --     -- your custom normal mode mappings
      --   },
      -- },
    },
  },
}

require("which-key").add(
  {
    { "<leader>f",  group = "[F]ile" },
    { "<leader>f_", hidden = true },
    { "<leader>fb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Browser", mode = "n" },
  }
)
-- To get telescope-file-browse loaded and working with telescope, you need to call load_extension, somewhere after setup function:
require("telescope").load_extension("file_browser")

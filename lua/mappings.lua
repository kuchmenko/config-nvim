require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del

del("n", "<leader>x")
del("i", "<C-h>")
del("i", "<C-l>")
del("i", "<C-j>")
del("i", "<C-k>")

map("n", "<leader>bd", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close tab" })

map("n", "<leader>bo", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "Close all tabs except current one" })

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map("i", "<C-s>", "<cmd>w<CR><ESC>", { desc = "general save file" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<S-L>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-H>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map({ "n", "t" }, "<C-/>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
  "n",
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- LSP
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { desc = "References", nowait = true })
map("n", "<leader>gi", function()
  require("telescope.builtin").lsp_implementations { reuse_win = true }
end, { desc = "Goto implementation" })
map("n", "<leader>gd", function()
  require("telescope.builtin").lsp_definitions { reuse_win = true }
end, { desc = "Goto Definition" })
map("n", "<leader>gy", function()
  require("telescope.builtin").lsp_type_definitions { reuse_win = true }
end, { desc = "Type definitions" })
map("n", "<leader> ", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- NEOTEST --
--
map("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })

map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run all tests in file" })

map("n", "<leader>tl", function()
  require("neotest").run.run_last()
end, { desc = "Run last test" })

map("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end, { desc = "Toggle test summary" })

map("n", "<leader>to", function()
  require("neotest").output_panel.toggle()
end, { desc = "Toggle test output panel" })

map("n", "<leader>tn", function()
  require("neotest").jump.next { status = "failed" }
end, { desc = "Jump to next failing test" })

map("n", "<leader>tp", function()
  require("neotest").jump.prev { status = "failed" }
end, { desc = "Jump to previous failing test" })

require("rip-substitute").setup {
	popupWin = {
		border = "single",
		matchCountHlGroup = "Keyword",
		noMatchHlGroup = "ErrorMsg",
		hideSearchReplaceLabels = false,
		position = "bottom", -- "top"|"bottom"
	},
	prefill = {
		normal = "cursorWord",   -- "cursorWord"|false
		visual = "selectionFirstLine", -- "selectionFirstLine"|false
		startInReplaceLineIfPrefill = false,
	},
	keymaps = {
		-- normal & visual mode
		confirm = "<CR>",
		abort = "q",
		prevSubst = "<Up>",
		nextSubst = "<Down>",
		insertModeConfirm = "<C-CR>", -- (except this one, obviously)
	},
	incrementalPreview = {
		matchHlGroup = "IncSearch",
		rangeBackdrop = {
			enabled = true,
			blend = 50, -- between 0 and 100
		},
	},
	regexOptions = {
		startWithFixedStringsOn = false,
		startWithIgnoreCase = false,
		-- pcre2 enables lookarounds and backreferences, but performs slower
		pcre2 = true,
		-- disable if you use named capture groups (see README for details)
		autoBraceSimpleCaptureGroups = true,
	},
	editingBehavior = {
		-- Experimental. When typing `()` in the `search` line, automatically
		-- adds `$n` to the `replace` line.
		autoCaptureGroups = false,
	},
	notificationOnSuccess = true,
}
--
-- require('which-key').register({
-- 	f = {
-- 		name = "[F]ile",
-- 		s = { function() require("rip-substitute").sub() end, "[S]ubstitute" },
--
-- 	},
-- }, { prefix = "<leader>", mode = { "n", "x" } })

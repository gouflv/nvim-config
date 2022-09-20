local copilot_status, copilot = pcall(require, 'copilot')
-- if not copilot_status then return end

local copilot_cmp_status, copilot_cmp = pcall(require, 'copilot_cmp')
-- if not copilot_cmp_status then return end

vim.defer_fn(function() 
  copilot.setup() 
  copilot_cmp.setup()
end, 100)



local status, im_select = pcall(require, 'im_select')
if not status then return end

im_select.setup({
  default_im_select = 'com.apple.keylayout.ABC',
  disable_auto_restore = 1
})

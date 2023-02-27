local status_ok, doge = pcall(require, "vim-doge")
if not status_ok then
  return
end

doge.setup {}

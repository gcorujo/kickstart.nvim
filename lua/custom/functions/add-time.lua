local function add_time()
  -- Parse line to get start and end time
  local line = vim.api.nvim_get_current_line()
  local startHour, startMin, endHour, endMin = string.match(line, '^.*(%d%d):(%d%d)%s+a%s+(%d%d):(%d%d).*')
  startHour = tonumber(startHour)
  startMin = tonumber(startMin)
  endHour = tonumber(endHour)
  endMin = tonumber(endMin)

  -- Calculate new time
  local totalHours = endHour - startHour
  local totalMins = math.abs(endMin - startMin)
  local strTotal = ''
  if totalHours > 0 then
    strTotal = '[' .. totalHours .. 'h' .. totalMins .. 'm] '
  else
    strTotal = '[' .. totalMins .. 'm] '
  end

  -- Get position in line where new time should go
  local lastIndex
  for index in (line):gmatch '():' do
    lastIndex = index
  end
  local totalTimePos = lastIndex + 3

  -- Insert new time in line
  local row = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, totalTimePos, row - 1, totalTimePos, { strTotal })

  print 'Total Time Added!'
end

return {
  add_time = add_time,
}

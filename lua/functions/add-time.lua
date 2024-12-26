local function add_resume()
  -- local buf_name = vim.api.nvim_buf_get_name(0)
  local pos = vim.api.nvim_win_get_cursor(0)
  local curr_line_index = pos[1]
  local offset = 10
  local lines = vim.api.nvim_buf_get_lines(0, curr_line_index - offset, curr_line_index + offset, true)

  -- Getting first and last line of paragraph
  local first_line_index, last_line_index
  for i = 1, offset do
    if lines[offset - i] == '' then
      first_line_index = curr_line_index - i
      break
    end
  end
  for j = 1, offset do
    if lines[offset + j] == '' then
      last_line_index = curr_line_index + j
      break
    end
  end

  -- Getting only paragraph lines and iteratring through it
  local lines = vim.api.nvim_buf_get_lines(0, first_line_index, last_line_index - 1, true)
  local tareas = {}
  for _, line in ipairs(lines) do
    local tarea = string.match(line, '^.*-%s*([%w%d ]+)%s*-.*')
    tareas[tarea] = line
    print(tarea)
  end
end

local function add_time()
  -- Parse line to get start and end time
  local line = vim.api.nvim_get_current_line()
  local startHour, startMin, endHour, endMin = string.match(line, '^.*(%d%d):(%d%d)%s+a%s+(%d%d):(%d%d).*')
  startHour = tonumber(startHour)
  startMin = tonumber(startMin)
  endHour = tonumber(endHour)
  endMin = tonumber(endMin)

  -- Calculate new time
  local totalMins
  local totalHours

  if startMin > endMin then
    endHour = endHour - 1
    endMin = endMin + 60
  end

  totalMins = math.abs(endMin - startMin)
  totalHours = math.abs(endHour - startHour)

  local strTotal = ''
  if totalHours == 0 then
    strTotal = '[' .. totalMins .. 'm] '
  elseif totalMins == 0 then
    strTotal = '[' .. totalHours .. 'h] '
  else
    strTotal = '[' .. totalHours .. 'h' .. totalMins .. 'm] '
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

  add_resume()
end

return {
  add_time = add_time,
}

local function calculate_time(start_hour, start_min, end_hour, end_min)
  -- Calculate new time
  if start_min > end_min then
    end_hour = end_hour - 1
    end_min = end_min + 60
  end

  local hours = math.abs(end_hour - start_hour)
  local mins = math.abs(end_min - start_min)

  return hours, mins
end

-- Function to sum up worked hours and minutes
function add_total_time(times)
  local total_hours = 0
  local total_minutes = 0

  for _, time in ipairs(times) do
    local hours = tonumber(time[1])
    local minutes = tonumber(time[2])

    total_hours = total_hours + hours
    total_minutes = total_minutes + minutes
  end

  -- Convert excess minutes to hours
  total_hours = total_hours + math.floor(total_minutes / 60)
  total_minutes = total_minutes % 60

  return total_hours, total_minutes
end

local function add_resume()
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

  -- Getting only paragraph lines and iterating through it
  lines = vim.api.nvim_buf_get_lines(0, first_line_index, last_line_index - 1, true)
  local tareas = {}
  for _, line in ipairs(lines) do
    local tarea = string.match(line, '^.*-%s*([%w%d ]+)%s*-.*')
    local startHour, startMin, endHour, endMin = string.match(line, '^.*(%d%d):(%d%d)%s+a%s+(%d%d):(%d%d).*')
    local hours, mins = calculate_time(tonumber(startHour), tonumber(startMin), tonumber(endHour), tonumber(endMin))
    -- Initialize the task list if it doesn't exist
    if not tareas[tarea] then
      tareas[tarea] = {}
    end
    -- Add the pair of hours and minutes to the tarea list
    table.insert(tareas[tarea], { hours, mins })
  end

  -- Iterate through dictionary and print a line for each task with their correspondening name and time
  local lines_to_add = {}
  table.insert(lines_to_add, '              Resumen:')
  for tarea, times in pairs(tareas) do
    local total_hours, total_minutes = add_total_time(times)
    table.insert(lines_to_add, string.format('              %s: %dh%dm', tarea, total_hours, total_minutes))
  end

  -- Insert the lines starting from one line below the cursor
  vim.api.nvim_buf_set_lines(0, curr_line_index, curr_line_index, false, lines_to_add)
end

local function add_time()
  -- Parse line to get start and end time
  local line = vim.api.nvim_get_current_line()
  local startHour, startMin, endHour, endMin = string.match(line, '^.*(%d%d):(%d%d)%s+a%s+(%d%d):(%d%d).*')

  local hours, mins = calculate_time(tonumber(startHour), tonumber(startMin), tonumber(endHour), tonumber(endMin))

  local strTotal = ''
  if hours == 0 then
    strTotal = '[' .. mins .. 'm] '
  elseif mins == 0 then
    strTotal = '[' .. hours .. 'h] '
  else
    strTotal = '[' .. hours .. 'h' .. mins .. 'm] '
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

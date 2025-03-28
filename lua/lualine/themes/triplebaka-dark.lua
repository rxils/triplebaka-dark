local colors = {
  red = '#e24673',
  yellow = '#ffc800',
  blue = '#39c5bb',
  gray_b = '#262626',
  gray_c = '#333333',
  fg = 'e6e6e6',
  bg = '1a1a1a'
}

local line = function(color_a)
  return {
    a = { bg = color_a, fg = colors.bg },
    b = { bg = colors.gray_b, fg = colors.fg },
    c = { bg = colors.gray_c, fg = colors.fg }
  }
end

return {
  normal = line(colors.blue),
  insert = line(colors.yellow),
  visual = line(colors.blue),
  replace = line(colors.yellow),
  command = line(colors.red),
  inactive = line(colors.red)
}

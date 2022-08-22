local db = require('dashboard')

db.custom_center = {
  {icon = '  ', desc = 'Find Files          ', shortcut = 'SPC f f',  action = 'Telescope find_files'},
  {icon = '  ', desc = 'File Browser        ', shortcut = 'SPC t o', action = 'NvimTreeOpen'},
}

# require files in subfolder
project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/battleship/*', &method(:require))

#instantiate game
a = Game.new(10)








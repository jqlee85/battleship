# require files in subfolder
project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/battleship/*', &method(:require))

#instantiate game
a = Game.new(10)

width = a.human.board.spaces.length
height = a.human.board.spaces[1].length
puts width.to_s + ' by ' + height.to_s + ' board.'

a.prompt_for_command

#puts letter_to_num('')




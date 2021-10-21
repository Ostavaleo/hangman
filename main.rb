# 1. Поздороваться
puts "Всем привет!"

require_relative 'lib/console_interface.rb'
require_relative 'lib/game'

# 2. Загрузить случайное слово из файла
word = File.readlines(__dir__ + '/data/words.txt', encoding: 'UTF-8', chomp: true).sample
game = Game.new(word)
console_interface = ConsoleInterface.new(game)

# Пока игра не закончилась
until game.over?
  # Вывести очередное состояние игры
  console_interface.print_out
  # Спросить очередную букву
  letter = console_interface.get_input
  # Обновить сосотяние игры
  game.play!(letter)
end

# Вывести финальное состояние игры
console_interface.print_out



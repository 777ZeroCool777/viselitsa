# encoding: utf-8
#
# Популярная детская игра, версия 3 - с чтением данных из внешних файлов
# https://ru.wikipedia.org/wiki/Виселица_(игра)

# подключаю классы

require_relative 'lib/game.rb'
require_relative 'lib/result_printer.rb'
require_relative 'lib/word_reader.rb'


puts "Игра виселица. Версия 3. C чтением данных из файлов.\n\n"

# создаю объект, печатающий результаты
printer = ResultPrinter.new

# создаю объект, отвечающий за ввод слова в игру
word_reader = WordReader.new

# Имя файла, откуда брать слово для загадывания
current_path = "./" + File.dirname(__FILE__)

words_file_name = current_path + "/data/words.txt"


# создаю объект типа Game, в конструкторе передаю загаданное слово из word_reader-а
# если аргумент пуст
# Так же можно загадать слово и передать его через аргумент
if ARGV.empty?
  game = Game.new(word_reader.read_from_file(words_file_name))
else
  game = Game.new(word_reader.read_from_args)
end

# основной цикл программы, в котором развивается игра
# выхожу из цикла, когда объект игры сообщает об этом, c пом. метода status
while game.status == 0 do
  # вывожу статус игры
  printer.print_status(game)
  # прошу угадать следующую букву
  game.ask_next_letter
end

printer.print_status(game)
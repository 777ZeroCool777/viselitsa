# encoding: utf-8
# Класс, печатающий состояние и результаты игры
class ResultPrinter

  def initialize
    # создаю поле класса, массив, хранящий изображения виселиц
    @status_image = []

    counter = 0 # счетчик шагов

    while counter <= 7 do # в цикле прочитаю 7 файлов и запишу из содержимое в массив
      # изображения виселиц лежат в папке /image/ в файлах 0.txt, 1.txt, 2.txt и т. д.
      file_name = "image/#{counter}.txt"

      begin
        f = File.new(file_name, "r:UTF-8") # вторым параметром явно указываю на кодировку файла
        @status_image << f.read # добавляю все содержимое файла в массив
        f.close
      rescue Errno::ENOENT
        @status_image << "\n [ изображение не найдено ] \n" # если файла нет, будет "заглушка"
      end

      counter += 1
    end
  end


  # Метод, рисующий виселицу
  def print_viselitsa(errors)
    puts @status_image[errors] # все картинки загружены в массив @status_image в конструкторе
  end

  # склонятор слова "Ошибки"
  def sklonyator_errors(errors_count)

    if (errors_count >= 5 && errors_count <= 7) || errors_count == 0
      return "Ошибок"
    elsif errors_count == 1
      return "Ошибка"
    else
      return "Ошибки"
    end
  end


  # основной метод, печатающий состояния объекта класса Game,
  # который нужно передать в качестве параметра
  def print_status(game)
    cls
    puts "\nСлово: #{get_word_for_print(game.letters, game.good_letters)}"

    puts "\n#{sklonyator_errors(game.errors_count)}: #{game.bad_letters.join(", ")}"

    print_viselitsa(game.errors_count)

    if game.status == -1
      puts "\nВы проиграли :(\n"
      puts "Загаданное слово было: " + game.letters.join("")
      puts
    elsif game.status == 1
      puts "Поздравляем, вы выиграли!\n\n"
    else
      puts "У вас осталось ошибок: " + (7 - game.errors_count).to_s
    end
  end

  # Служебный метод класса, возвращающий строку, изображающую загаданное слово
  # с открытыми угаданными буквами
  def get_word_for_print(letters, good_letters)
    result = ""

    for item in letters do
      if good_letters.include?(item)
        result += item + " "
      else
        result += "__ "
      end
    end

    return result
  end

  # метод чистит экран
  def cls
    system "clear" or system "cls"
  end
end

# encoding: utf-8
#
# Класса, отвечающий за ввод данных в программу "виселица"
class WordReader

  # Сохраняю старую возможность читать слово из аргументов командной строки.
  # В качестве отедльного метода для обратной совместимости.
  def read_from_args
    return ARGV[0]
  end

  # Метод, возвращающий случайное слово, прочитанное из файла,
  # имя файла передается как аргумент метода
  def read_from_file(file_name)
    begin
      f = File.new(file_name, 'r:utf-8')
      lines = f.readlines
      f.close
      return lines.sample.chomp
    rescue Errno::ENOENT => e
      puts "Файл не найден"
      abort e.message
    end
  end
end
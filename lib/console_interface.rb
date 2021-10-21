class ConsoleInterface
  FIGURES =
    Dir[__dir__ + '/../data/figures/*.txt'].
    sort.
    map {|file_name| File.read(file_name)}

  def initialize(game)
    @game = game
  end

  def print_out
    puts "Слово #{word_to_show}"
    puts "#{figure}"
    puts "Ошибки (#{@game.errors_made}): #{errors_to_show}"
    puts "У вас осталось ошибок #{@game.errors_allowed}"

    if @game.won?
      puts "Поздравляю, Вы выиграли"
    elsif @game.lost?
      puts "Вы проиграли, загаданное слов #{@game.word}"
    end
  end

  def figure
    FIGURES[@game.errors_made]
  end

  def word_to_show
    result =
      @game.letters_to_guess.map do |letter|
        if letter == nil
          "__"
        else
          letter
        end
      end

      result.join(' ')
  end

  def errors_to_show
    @game.errors.join(", ")
  end

  def get_input
    print "Введите следующую букву: "
    letter = gets[0].upcase
  end
end



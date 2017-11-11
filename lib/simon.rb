class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")
    puts "Let's play a game of Simon! Simon will give you a color sequence,\nand your goal is to repeat the color sequence back in the correct order."
      sleep(8)
    puts "\nHere's the first color:\n\n"
      sleep (2)
    until @game_over
      take_turn
      system("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color

    @seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      sleep(0.25)
    end
  end

  def require_sequence
    puts "Can you repeat the color sequence? Type each color on a new line."

    @seq.each do |color|
      player_color = gets.chomp.strip.downcase
      if color != player_color
        @game_over = true
        break
      end
    end

  end

  def add_random_color
    @seq << COLORS.shuffle.first
  end

  def round_success_message
    system("clear")
    puts "Correct! Here's the next color sequence: "
    sleep(2)
  end

  def game_over_message
    puts "Game over. You made it through #{@sequence_length - 1} rounds. Try again!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

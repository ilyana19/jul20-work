class Player
  def initialize(name)
    @name = name
    @gold_coins = 0
    @health_points = 10
    @lives = 5
  end

  # get info
  def name
    @name
  end

  def gold_coins
    @gold_coins
  end

  def health_points
    @health_points
  end

  def lives
    @lives
  end

  # do stuff
  def level_up
    @lives += 1
  end

  def collect_treasure
    @gold_coins += 1

    if @gold_coins % 10 == 0
      level_up
    end
  end

  def do_battle(damage)
    @health_points -= 1

    if @health_points < 1
      @lives -= 1

      if @lives == 0
        restart
      end
      @health_points = 10
    end
  end

  def restart
    initialize
  end
end

player1 = Player.new("Faye Phlorik")

puts <<~TEXT

  Current Stats
  ================
  Lives: #{player1.lives}
  HP: #{player1.health_points}
  Gold: #{player1.gold_coins}

  #{player1.name} goes on an adventure!
  ==========================================
TEXT

player1.collect_treasure
puts <<~TEXT
  #{player1.name} found a treasure box and opened it and received a gold coin.

  #{player1.name} now has #{player1.gold_coins} gold.
TEXT
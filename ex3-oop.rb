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
    @health_points -= damage

    if @health_points < 1
      @lives -= 1
      @health_points = 10

      if @lives == 0
        restart
      end
    end
  end

  def restart
    @gold_coins = 0
    @health_points = 10
    @lives = 5
  end
end

# declare variables
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

  Current Stats
  ================
  Lives: #{player1.lives}
  HP: #{player1.health_points}
  Gold: #{player1.gold_coins}

TEXT

20.times do
  player1.collect_treasure
  puts "#{player1.name} found a treasure box and opened it and received a gold coin."
end

puts <<~TEXT
  Current Stats
  ================
  Lives: #{player1.lives}
  HP: #{player1.health_points}
  Gold: #{player1.gold_coins}

  #{player1.name} goes on an adventure!
  ==========================================
TEXT

player1.do_battle(1)
puts <<~TEXT
  #{player1.name} found a treasure box and opened it but it was actually a mimic and the monster.

  Current Stats
  ================
  Lives: #{player1.lives}
  HP: #{player1.health_points}
  Gold: #{player1.gold_coins}

TEXT

6.times do
  player1.do_battle(10)
end
puts "#{player1.name} found a treasure box and opened it but it was actually a mimic and the monster."


puts <<~TEXT

  Current Stats
  ================
  Lives: #{player1.lives}
  HP: #{player1.health_points}
  Gold: #{player1.gold_coins}
TEXT
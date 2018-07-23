###########################################
# Idea
# => Change some states the player has
# => Asking user input to choose action to control the character "Faye Phlorik"
# when it encounters "something"
# => The "something" may be treasure, or it can be a monster
# => Battle is similar to dnd, check if it hits faye and damage dealt if hit is
# randomized
# => Loot is randomized as well
###########################################

class Player
  def initialize(name) # original stats
    @name = name
    @wallet = 100
    @hp = 18
    @lvl = 1
    @exp = 0
    @ac = 12 # armour class
  end

  # get player current stats
  def name
    return @name
  end

  def wallet
    return @wallet
  end

  def current_hp
    return @hp
  end

  def current_level
    return @lvl
  end

  def current_exp
    return @exp
  end

  def ac
    return @ac
  end

  def event
    return @event
  end

  def gold
    return @gold
  end

  def initiative
    return @initiative
  end

  def initiative=(n)
    return @initiative = n
  end

  def current_hp=(n)
    return @hp = n
  end

  def current_exp=(n)
    return @exp = n
  end

  def current_level=(n)
    return @current_level = n
  end

  # actions
  def adventure
    e = {
      1 => "monster",
      2 => "treasure"
    }

    random_event = e.values # returns the values into an array
    @event = random_event[Random.rand(random_event.length)] # randomize events
    #returns ^ the event and can be called later
  end

  def collect_treasure
    @gold = Random.rand(1..20)
    @wallet += @gold
  end

  def level_up
    if @exp >= 100
      @lvl = 2
    elsif @exp >= 300
      @lvl = 3
    end
  end

  def get_stats
    puts <<~TEXT

      =======================
      #{name} Stats
      =======================
      Level: #{current_level}
      HP: #{current_hp}
      Gold: #{wallet}
      EXP: #{current_exp}

    TEXT
  end
end

# declare variables
player = Player.new("Faye Phlorik")

# determine initiative (who attacks first)
def roll_initiative
  return initiative = Random.rand(1..20)
end

def create_monster
  # randomize monster stats (should really be another object...)
  # monster_hp = 2 * Random.rand(1..6)
  monster_hp = 5
  monster_ac = 15
  return monster_hp, monster_ac
end

puts <<~TEXT

  #{player.name} Stats
  =======================
  Level: #{player.current_level}
  HP: #{player.current_hp}
  Gold: #{player.wallet}

  #{player.name} goes on an adventure!
  ==========================================
TEXT

loop do
  player.adventure
  if player.event == "monster"
    puts "#{player.name} encountered a monster."
    puts ""

    monster_hp = create_monster[0]
    monster_ac = create_monster[1]

    while monster_hp > 0 && player.current_hp > 0
      monster_atk = Random.rand(1..20)
      monster_dmg = Random.rand(1..6)
      player_atk = Random.rand(1..20)
      player_dmg = Random.rand(1..8)

      # check if monster hits
      if monster_atk >= player.ac
        puts "Monster dealt #{monster_dmg} damage."
        player.current_hp -= monster_dmg
        if player.current_hp == 0
          break
        end
      else
        puts "Monster misses #{player.name}."
      end
      # check if player hits
      if player_atk >= monster_ac
        puts "#{player.name} dealt #{player_dmg} damage."
        monster_hp -= player_dmg
        if monster_hp == 0
          break
        end
      else
        puts "#{player.name} misses."
      end
    end

    # show how much exp earned while player is still alive
    if player.current_hp > 0
      gained_exp = Random.rand(50..75)
      player.current_exp += gained_exp
      puts <<~TEXT

        ********************************************
        * Congratulations!
        *
        * #{player.name} gained #{gained_exp} exp.
        ********************************************
      TEXT

      # check level up
      player.level_up
      player.get_stats
    end

  elsif player.event == "treasure"
    puts "#{player.name} found a treasure."
    player.collect_treasure
    puts "#{player.name} opened a chest with #{player.gold} gold pieces in it."
  end

  puts ""

  # end the adventure loop
  if player.current_hp < 1
    puts "#{player.name} died."
    break
  end
end

puts <<~TEXT

  #{player.name} Stats
  =======================
  Level: #{player.current_level}
  HP: #{player.current_hp}
  Gold: #{player.wallet}
  EXP: #{player.current_exp}

TEXT

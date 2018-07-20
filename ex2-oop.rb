class Cat
  def initialize(name, preferred_food, meal_time)
    @name = name
    @preferred_food = preferred_food
    @meal_time = meal_time
  end

  def eats_at
    if @meal_time > 12
      return "#{@meal_time - 12}PM"
    elsif @meal_time == 12
      return "#{@meal_time}PM"
    else
      return "#{@meal_time}AM"
    end
  end

  def meow
    puts "My name is #{@name} and I eat #{@preferred_food} at #{eats_at}"
  end
end

cat1 = Cat.new("Professer Mew", "Salmon", 11)
cat2 = Cat.new("Mr. Snuggles", "Sardine", 18)

cat1.meow
cat2.meow
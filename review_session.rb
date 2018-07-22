class Dog
  # can't change the breed but also wants to ask user for the breed
  def initialize(breed)
    @breed = breed
    @speed = 0
  end

  # don't always need initializer as long as there's a getter and setter
  def breed
    return @breed
  end

  def colour
    return @colour
  end

  def speed
    return @speed
  end

  # def breed=(breed)
  #   return @breed = breed
  # end

  def run
    @speed += 10
  end
end

fido = Dog.new("German Sheperd") # runs initialize method once if it exists

# fido.breed=("German Shepherd") # => same as below
# fido.breed = "German Shepherd"
puts fido.breed

fido.run
puts fido.speed
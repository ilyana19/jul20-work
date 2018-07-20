class Paperboy
  # initialize starting values
  def initialize(name)
    @name = name
    @experience = 0
    @earnings = 0
    @quota = 50
  end

  def name
    @name
  end

  def earnings
    @earnings
  end

  def quota
    @quota
  end

  def deliver(start_address, end_address)
    num_papers = (end_address - start_address).abs + 1 # returns an absolute number
    over_quota = num_papers - @quota
    @experience += num_papers

    if num_papers >= @quota
      @earnings += (@quota * 0.25) + (over_quota * 0.5)
      @quota += num_papers/2 # update the quota based on how many delivered
    elsif num_papers < @quota
      @earnings += ((num_papers * 0.25) - 2)
      @quota += num_papers/2 # update the quota based on how many delivered
    end
  end

  def report
    puts "I'm #{@name}, I've delivered #{@experience} papers and I've earned #{@earnings} so far!"
  end
end

tommy = Paperboy.new("Tommy")

puts tommy.quota
tommy.deliver(101, 160)
puts tommy.earnings
tommy.report

puts ""

puts tommy.quota
tommy.deliver(1, 75)
puts tommy.earnings
tommy.report
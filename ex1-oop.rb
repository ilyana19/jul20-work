class BankAccount
  # initialize class
  def initialize(balance, interest_rate)
    @balance = balance
    @interest_rate = interest_rate
  end

  def balance
    return @balance.to_f.round(2)
  end

  def interest_rate
    return (@interest_rate / 100).to_f
  end

  def deposit=(amount)
    return @balance += amount
  end

  def withdrawl=(amount)
    return @balance -= amount
  end

  def gain_interest
    return @balance *= (1 + interest_rate)
  end
end

# create a new bank account
account = BankAccount.new(0, 1.5)
account.deposit = 10000
puts "Current Balance: #{account.balance}"
puts "Current Interest Rate: #{account.interest_rate}"
account.withdrawl = 10
puts "Current Balance: #{account.balance}"
account.gain_interest
puts "#{account.balance}"
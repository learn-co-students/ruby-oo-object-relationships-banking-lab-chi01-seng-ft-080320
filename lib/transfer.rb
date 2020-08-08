class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if !@@all.include?(self) && @sender.balance >= @amount && self.valid?
      @sender.balance -= @amount 
      @receiver.balance += @amount 
      self.status = "complete"
      @@all << self
    else 
      self.status = "rejected"
      p "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    reversed = @@all[-1]
    reversed.sender.balance += reversed.amount 
    reversed.receiver.balance -= reversed.amount 
    reversed.status = "reversed"
  end

  def self.all
    @@all
  end

end

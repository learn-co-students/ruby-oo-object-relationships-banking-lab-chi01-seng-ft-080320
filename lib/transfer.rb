class Transfer

  #initialize with sender, receiver, pending status, and transfer amount
  attr_reader :sender, :receiver, :amount
  attr_accessor :status 
  @@all = []
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount 
    @status = "pending"
    
  end 
  #uses sender and receiver valid? methods to see if both accounts are valid
  def valid?
    @account1 = BankAccount.all.find do |account_instance|
    account_instance == @sender
    end 
    @account2 = BankAccount.all.find do |account_instance| 
      account_instance == @receiver
    end
    @account1.valid? && @account2.valid?
  end
  #checks account validity, sender balance, and whether the transaction has happened or not. If true, true, false, then executes transaction
  def execute_transaction
    if !Transfer.all.include?(self) && @sender.balance >= @amount && self.valid?
      @sender.balance -= @amount 
      @receiver.balance += @amount 
      self.status = "complete"
      Transfer.all << self
    else #if it doesn't pass, the following message is displayed
      self.status = "rejected"
      p "Transaction rejected. Please check your account balance."
  end 
  end
  #can reverse a transfer
  def reverse_transfer 
    last_transfer = Transfer.all[-1]
    last_transfer.sender.balance += last_transfer.amount 
    last_transfer.receiver.balance -= last_transfer.amount 
    last_transfer.status = "reversed"
  end

  def self.all 
    @@all 
  end

  
end

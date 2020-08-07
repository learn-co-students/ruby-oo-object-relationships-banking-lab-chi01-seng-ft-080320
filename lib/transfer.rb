require "pry"

class Transfer

  attr_reader :name, :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount )
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    @counter = 0
  end

  def valid?
    reciever = self.receiver
    sender = self.sender
    valid_reciever = false
    valid_sender = false
    if (BankAccount.all.find {|individual_bank_acc| individual_bank_acc.object_id == reciever.object_id} &&
        BankAccount.all.find {|individual_bank_acc| individual_bank_acc.object_id == self.receiver.object_id} )
        valid_reciever = reciever.valid?
        valid_sender = sender.valid?
    end
    if(valid_reciever == true && valid_sender == true)
      true
    end
  end

  def execute_transaction 
    if(@counter < 1 && self.sender.balance > self.amount && self.valid? == true)
      amount = self.amount
      self.receiver.balance += amount
      self.sender.balance -= amount
      self.status = "complete"
      @counter +=1
    else 
      self.status= "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if(self.status == "complete")
      amount = self.amount
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
      @counter +=1
    end 
  end

end


require "pry"

class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        self.class.all << self
    end

    def deposit(amount)
        self.balance += amount
    end 

    def display_balance 
        "Your balance is $#{@balance}."
    end 

    def valid?
        self.balance > 0 && self.status == 'open'
        # binding.pry
    end 

    def close_account
        self.status = 'closed'
    end 

    def self.all
        @@all
    end 

end

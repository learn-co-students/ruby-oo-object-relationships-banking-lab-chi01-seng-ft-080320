class BankAccount

    #initializes with name, balance of 1000, status of open, and name
    def initialize(owner)
        @name = owner
        @balance = 1000
        @status = "open"

        BankAccount.all << self 
    end 
    #can change anything but name
    attr_reader :name 
    attr_accessor :balance, :status
    @@all = []

    def self.all
        @@all 
    end
    #can deposit money
    def deposit(amount)
        self.balance += amount 
    end
    #can display balance
    def display_balance
        p "Your balance is $#{self.balance}." 
    end
    #checks to see if balance is greater than zero and status is open
    def valid?
        self.balance > 0 && self.status == "open"
    end 
    #can close account
    def close_account
        self.status = "closed"
    end 
end 


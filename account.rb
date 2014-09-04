require_relative 'transaction'
require 'pry'
require 'csv'


class Account

  attr_reader :name, :balance_data, :transactions_data

  def initialize(name, balance_data, transactions_data)
    @name = name
    @balance_data = balance_data
    @transactions_data = transactions_data
  end

  def starting_balance
    balance = 0
    CSV.foreach(balance_data, headers: true, header_converters: :symbol) do |row|
      if row[:account] == name
        balance = row[:balance]
      end
    end
    balance.to_f
  end

  def current_balance
    balance = starting_balance
    transactions.each do |transaction|
      balance += transaction.amount
    end
    balance
  end

  def transactions
    transactions = []
    CSV.foreach(transactions_data, headers: true, header_converters: :symbol) do |row|
      if row[:account] == name
        transactions << Transaction.new(row[:amount], row[:date], row[:description])
      end
    end
    transactions
  end

  def summary
    summaries = []
    transactions.each do |transaction|
      summaries << transaction.summary
    end
    summaries
  end

end

acct = Account.new("Business Checking", 'balances.csv', 'bank_data.csv')
binding.pry

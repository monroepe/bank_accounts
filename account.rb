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
    balance
  end

  def current_balance

  end

  def transactions
    transactions = []
    CSV.foreach(balance_data, headers: true, header_converters: :symbol) do |row|
      if row[:account] == name
        transactions = Trans
  end

  def summary

  end

end

acct = Account.new("Business Checking", 'balances.csv', 'bank_data.csv')
binding.pry

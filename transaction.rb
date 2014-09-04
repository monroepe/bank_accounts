require 'pry'

class Transaction

  attr_reader :type, :date, :amount, :source

  def initialize(amount, date, type, source)
    @amount = amount.to_f
    @date = date
    @type = type
    @source = source
  end

  def deposit?
    type.downcase == 'deposit'
  end

  def summary
    "$#{amount}  #{type.upcase}  #{date} - #{source}"
  end

end


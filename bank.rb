require_relative 'account'
require_relative 'transaction'

def accounts
  accounts = []
  CSV.foreach('balances.csv', headers: true, header_converters: :symbol) do |row|
    accounts << row[:account]
  end
  accounts
end

accounts.each do |name|
  account = Account.new(name, 'balances.csv', 'bank_data.csv')
  puts "=== #{account.name} ==="
  puts "Starting Balance: #{account.starting_balance}"
  puts "Ending Balance: #{account.current_balance}"
  puts

  account.summary.each do |transaction|
    puts transaction
  end
  puts '========'
  puts
end


# ==== Purchasing Account ====
# Starting Balance: $201.94
# Ending Balance:   $637.09

# $29.99   WITHDRAWAL  09/12/2013 - Amazon.com
# $500.33  DEPOSIT     09/14/2013 - Sales Deposit
# $35.19   WITHDRAWAL  09/15/2013 - Staples.com
# ========

# ==== Business Checking ====
# Starting Balance: $594.19
# Ending Balance:   $923.94

# $60.19   WITHDRAWAL  09/12/2013 - Pizza Pizza
# $400.20  WITHDRAWAL  09/14/2013 - Payroll
# $790.14  DEPOSIT     09/15/2013 - Sales Deposit
# ========

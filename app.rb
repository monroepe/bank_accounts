require 'sinatra'
require 'sinatra/reloader'
require_relative 'account'
require_relative 'transaction'
require 'csv'
require 'pry'


def account_names
  names = []
  CSV.foreach('balances.csv', headers: true, header_converters: :symbol) do |row|
    names << row[:account]
  end
  names
end

def accounts
  accounts = []
  account_names.each do |name|
    accounts << Account.new(name, 'balances.csv', 'bank_data.csv')
  end
  accounts
end

def get_account(name)
  accounts.each do |account|
    if account.name == name
      return account
    end
  end
end


get '/' do
  erb :index
end

get '/accounts' do
  erb :'accounts/index', locals: {accounts: accounts}
end

get '/accounts/:account_name' do
  account = get_account(params[:account_name])
  erb :'accounts/show', locals: {account: account}
end

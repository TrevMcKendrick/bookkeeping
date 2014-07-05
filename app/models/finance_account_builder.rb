class FinanceAccountBuilder
  include ActiveModel::Model

  attr_accessor :plaid_type, :username, :password, :email

  def initialize(hash)
    @plaid_type = hash[:plaid_type]
    @username = hash[:username]
    @password = hash[:password]
    @email = hash[:email]
  end

  def as_finance_account
    account = Plaid.call.add_account(@plaid_type,@username,@password,@email)
    FinanceAccount.create(:access_token => account[:access_token])
  end

  def
end

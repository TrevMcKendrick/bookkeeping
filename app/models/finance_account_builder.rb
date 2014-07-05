class FinanceAccountBuilder
  include ActiveModel::Model

  attr_accessor :plaid_type, :username, :password, :email

  def initialize(hash)
    @plaid_type = hash[:plaid_type] || "wells"
    @username = hash[:username] || "plaid_test"
    @password = hash[:password] || "plaid_good"
    @email = hash[:email] || "test@plaid.com"
  end

  def as_finance_account
    account = Plaid.call.add_account(@plaid_type,@username,@password,@email)
    FinanceAccount.create(:access_token => account[:access_token])
  end

end

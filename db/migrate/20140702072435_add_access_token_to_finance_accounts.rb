class AddAccessTokenToFinanceAccounts < ActiveRecord::Migration
  def change
    add_column :finance_accounts, :access_token, :string
  end
end

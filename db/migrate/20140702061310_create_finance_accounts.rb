class CreateFinanceAccounts < ActiveRecord::Migration
  def change
    create_table :finance_accounts do |t|
      t.string :plaid_id

      t.timestamps
    end
  end
end

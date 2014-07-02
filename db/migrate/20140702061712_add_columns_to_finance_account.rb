class AddColumnsToFinanceAccount < ActiveRecord::Migration
  def change
    add_column :finance_accounts, :balance, :text
    add_column :finance_accounts, :meta, :text
    add_column :finance_accounts, :institution_type, :string
    add_column :finance_accounts, :type, :string
  end
end

class RenameTypeColumn < ActiveRecord::Migration
  def change
    rename_column :transactions, :type, :account_type
  end
end

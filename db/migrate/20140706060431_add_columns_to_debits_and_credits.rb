class AddColumnsToDebitsAndCredits < ActiveRecord::Migration
  def change
    add_column :debits, :account_id, :integer
    add_column :debits, :journal_entry_id, :integer
    add_column :debits, :amount, :decimal, :precision => 10, :scale => 2
    add_column :credits, :account_id, :integer
    add_column :credits, :journal_entry_id, :integer
    add_column :credits, :amount, :decimal, :precision => 10, :scale => 2
  end
end

class AddAmountsToDebitsAndCredits < ActiveRecord::Migration
  def change
    add_column :debits, :amount, :decimal, :precision => 9, :scale => 2
    add_column :credits, :amount, :decimal, :precision => 9, :scale => 2
  end
end

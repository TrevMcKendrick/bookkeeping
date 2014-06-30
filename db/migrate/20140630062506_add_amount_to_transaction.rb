class AddAmountToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :amount, :decimal, :precision => 9, :scale => 2
  end
end

class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :account_type
      t.date :date

      t.timestamps
    end
  end
end

class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.string :account

      t.timestamps
    end
  end
end

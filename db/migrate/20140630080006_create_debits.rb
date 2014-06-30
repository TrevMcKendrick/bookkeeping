class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.string :category

      t.timestamps
    end
  end
end

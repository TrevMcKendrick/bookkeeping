class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.string :account

      t.timestamps
    end
  end
end

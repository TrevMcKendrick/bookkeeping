class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.string :category

      t.timestamps
    end
  end
end

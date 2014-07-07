class AddColumnsToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :name, :string
    add_column :accounts, :type, :string
    add_column :accounts, :contra, :string
  end
end

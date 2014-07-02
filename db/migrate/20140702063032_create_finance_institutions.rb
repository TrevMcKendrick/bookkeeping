class CreateFinanceInstitutions < ActiveRecord::Migration
  def change
    create_table :finance_institutions do |t|
      t.string :plaid_type
      t.string :name

      t.timestamps
    end
  end
end

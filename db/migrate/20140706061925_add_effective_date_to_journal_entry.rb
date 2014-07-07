class AddEffectiveDateToJournalEntry < ActiveRecord::Migration
  def change
    add_column :journal_entries, :effective_date, :date
  end
end

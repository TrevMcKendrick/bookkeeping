class JournalEntryQuery
  # include ActiveModel::Model
  #
  # def initialize(hash)
  #   @start_date = hash[:start_date]
  #   @end_date = hash[:end_date]
  #   @user = hash[:user]
  #   @account = hash[:account]
  # end
  #
  # def as_journal_entries
  #   # account = @user.accounts.where(:name => @account)
  #
  #   time_range = (@start_date.to_date)..(@end_date.to_date)
  #   JournalEntry.joins(:debits).where(debits: { amount: 100 })
  #
  #   Debit.joins(:journal_entry).where('journal_entries.effective_date = "2014-06-06"')
  #
  #   # Debit.joins(:journal_entries).where(journal_entries: { effective_date: time_range})
  #
  #   # Client.joins(:orders).where(orders: { created_at: time_range })
  #
  #   # @user.journal_entries.where(:effective_date => (@start_date.to_date)..(@end_date.to_date))
  #
  # end

end

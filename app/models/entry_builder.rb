class EntryBuilder
  include ActiveModel::Model

  attr_accessor :amount, :date, :debit, :credit

  def initialize(hash)
    @amount = hash[:amount]
    @date = hash[:date]
    @debit = hash[:debit]
    @credit = hash[:credit]
  end

  def as_entry(user)
    je = JournalEntry.new(:effective_date => @date)
    je.debits.build(:amount => @amount, :account => user.account(@debit))
    je.credits.build(:amount => @amount, :account => user.account(@credit))
    je.save
    je
  end

end

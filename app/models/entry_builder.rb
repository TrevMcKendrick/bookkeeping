class EntryBuilder
  include ActiveModel::Model

  attr_accessor :amount, :date, :debit_account, :credit_account

  def initialize(hash)
    @amount = hash[:amount]
    @date = hash[:date]
    @debit_account = hash[:debit_account]
    @credit_account = hash[:credit_account]
  end

  def as_entry(user)
    je = JournalEntry.new(:effective_date => @date)
    je.debits.build(:amount => @amount, :account => user.account(@debit_account))
    je.credits.build(:amount => @amount, :account => user.account(@credit_account))
    je.save
    je
  end

end

class EntryBuilder
  include ActiveModel::Model

  attr_accessor :amount, :date, :account

  def initialize(hash)
    @amount = hash[:amount]
    @date = hash[:date]
    @account = hash[:account]
  end

  def as_entry
    @entry = Plutus::Entry.build(
      :description => "This is a manual entry",
          :commercial_document => nil,
          :debits => [{:account => debit_account, :amount => @amount}],
          :credits => [{:account => credit_account, :amount => @amount}],
          :effective_date => @date
      )
  end

  def debit_account
    @account
  end

  def credit_account
    "Credit Card Payable"
  end
end

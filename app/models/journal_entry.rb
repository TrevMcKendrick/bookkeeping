class JournalEntry < ActiveRecord::Base
  has_many :debits
  has_many :credits
  # belongs_to :user

  def debit_total
    self.debits.sum(:amount)
  end

  def credit_total
    self.credits.sum(:amount)
  end
end

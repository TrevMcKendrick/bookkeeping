class JournalEntry < ActiveRecord::Base
  has_many :debits
  has_many :credits

  validate :has_debits?
  validate :has_credits?
  validate :balances?

  def debit_total
    self.debits.sum(:amount)
  end

  def credit_total
    self.credits.sum(:amount)
  end

  private

  def has_debits?
    errors[:base] << "Journal entry needs a debit" if self.debits.blank?
  end

  def has_credits?
    errors[:base] << "Journal entry needs a credit" if self.credits.blank?
  end

  def balances?
    errors[:base] << "The journal entry doesn't balance" if self.debit_total != self.credit_total
  end

end

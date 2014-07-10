class JournalEntry < ActiveRecord::Base
  include ActiveModel::Validations

  has_many :debits
  has_many :credits
  validates_associated :debits
  validates_associated :credits
  validates :effective_date, presence: true

  def debit_total
    self.debits.sum(:amount)
  end

  def credit_total
    self.credits.sum(:amount)
  end

end

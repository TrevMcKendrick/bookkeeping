class Debit < ActiveRecord::Base
  belongs_to :journal_entry
  belongs_to :account

  validates :amount, :account, presence: true
end

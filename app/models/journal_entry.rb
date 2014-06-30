class JournalEntry < ActiveRecord::Base
  has_many :debits
  has_many :credits
end

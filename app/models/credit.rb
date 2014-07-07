class Credit < ActiveRecord::Base
  belongs_to :journal_entry
  belongs_to :account
end

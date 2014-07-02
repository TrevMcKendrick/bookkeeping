class FinanceInstitution < ActiveRecord::Base
  validates :plaid_type, uniqueness: true
  validates :name, uniqueness: true
end

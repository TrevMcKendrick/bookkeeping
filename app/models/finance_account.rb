class FinanceAccount < ActiveRecord::Base
  serialize :balance, Hash
  serialize :meta, Hash
end

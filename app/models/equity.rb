class Equity < Account
  before_create :defaults

  belongs_to :user

  CHART_OF_ACCOUNTS = ["Capital Contributions", "Retained Earnings"]

  def defaults
    self.type = "Equity"
  end

  def balance_as_of(date)
    credit_balance_as_of(date) - debit_balance_as_of(date)
  end

  def self.balance_as_of(date)
    self.credit_balance_as_of(date) - self.debit_balance_as_of(date)
  end

end

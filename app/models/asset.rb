class Asset < Account
  before_create :defaults

  belongs_to :user

  CHART_OF_ACCOUNTS = ["Cash", "Accounts Receivable", "Equipment"]

  def defaults
    self.type = "Asset"
  end

  def balance_as_of(date)
    debit_balance_as_of(date) - credit_balance_as_of(date)
  end

  def self.balance_as_of(date)
    self.debit_balance_as_of(date) - self.credit_balance_as_of(date)
  end

end

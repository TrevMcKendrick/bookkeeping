class Asset < Account
  before_save :defaults

  belongs_to :user

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

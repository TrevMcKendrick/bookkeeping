class Expense < Account
  before_create :defaults

  belongs_to :user

  CHART_OF_ACCOUNTS = ["Payroll Expense"]

  def defaults
    self.type = "Expense"
  end

  def balance_between_dates(start_day, end_day)
    debit_balance_between_dates(start_day, end_day) - credit_balance_between_dates(start_day, end_day)
  end

  def self.balance_between_dates(start_day, end_day)
    self.debit_balance_between_dates(start_day, end_day) - self.credit_balance_between_dates(start_day, end_day)
  end
end

class IncomeStatement
  include ActiveModel::Model

  attr_accessor :start_date, :end_date, :user, :revenues, :expenses

  def initialize(hash)
    @user = hash[:user]
    @start_date = hash[:start_date]
    @end_date = hash[:end_date]
    @revenues = @user.revenues
    @expenses = @user.expenses
  end

  def to_csv(options = {})
    CSV.generate(options) do |csv|
      self.revenues.each do |revenue|
        csv << [revenue.name,revenue.balance_between_dates(self.start_date, self.end_date).to_s]
      end
    end
  end

  def profit(start_date, end_date)
    self.revenues.balance_between_dates(start_date, end_date) - self.expenses.balance_between_dates(start_date, end_date)
  end

end

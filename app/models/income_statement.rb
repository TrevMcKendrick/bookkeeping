class IncomeStatement
  include ActiveModel::Model

  attr_accessor :start_date, :end_date, :user, :revenues, :expenses

  def initialize(hash)
    @user = hash[:user]
    @start_date = hash[:start_date]
    @end_date = hash[:end_date]
    @revenues = @user.revenues.to_a
    @expenses = @user.expenses.to_a
  end

  def to_csv(options = {})
    CSV.generate(options) do |csv|
      self.revenues.each do |revenue|
        csv << [revenue.name,revenue.balance_between_dates(self.start_date, self.end_date).to_s]
      end
    end
  end

end

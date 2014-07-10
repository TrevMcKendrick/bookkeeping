class BalanceSheet
  include ActiveModel::Model

  attr_accessor :as_of, :period, :user, :assets, :liabilities, :equities

  def initialize(hash)
    @user = hash[:user]
    @as_of = hash[:as_of]
    @period = hash[:period]
    @assets = @user.assets.to_a
    @liabilities = @user.liabilities.to_a
    @equities = @user.equities.to_a
  end

  def to_csv(options = {})
    CSV.generate(options) do |csv|
      self.line_items.each do |line_item|
        csv << self.line_item_array(line_item)
      end
    end
  end

  def line_item_array(line_item)
    [line_item.name, line_item.balance_as_of(self.as_of).to_s]
  end

end

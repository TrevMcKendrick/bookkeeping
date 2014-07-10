class BalanceSheetsController < ApplicationController

  def index
    @balance_sheet = BalanceSheet.new(:user => current_user, :as_of => "2014-07-01", :period => "Annual")
    respond_to do |format|
      format.html
      format.xls
      # format.csv { send_data @balance_sheet.to_csv }
    end
  end

end

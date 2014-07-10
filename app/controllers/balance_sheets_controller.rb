class BalanceSheetsController < ApplicationController

  def index
    @balance_sheet = BalanceSheet.new(:user => current_user, :as_of => "2014-12-31", :period => "Annual")
    @income_statement = IncomeStatement.new(:user => current_user, :start_date => "2014-01-01", :end_date => "2014-12-31")
    respond_to do |format|
      format.html
      format.xls
    end
  end

end

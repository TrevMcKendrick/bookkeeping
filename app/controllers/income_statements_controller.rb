class IncomeStatementsController < ApplicationController

  def index
    @income_statement = IncomeStatement.new(:user => current_user, :start_date => "2014-07-01", :end_date => "2014-07-09")
    respond_to do |format|
      format.html
      format.xls
    end
  end

end

class IncomeStatementsController < ApplicationController

  def index
    @income_statement = IncomeStatement.new(:user => current_user, :start_date => "2014-07-01", :end_date => "2014-07-09")
    respond_to do |format|
      format.html
      format.xls
      # format.csv { send_data @income_statement.to_csv }
    end
  end

end

class IncomeStatementsController < ApplicationController

  def show
    @user = current_user
    @income_statement = IncomeStatement.new
    # respond_to do |format|
    #   format.html
    #   format.csv { send_date @income_statement.to_csv }
    # end
  end

end

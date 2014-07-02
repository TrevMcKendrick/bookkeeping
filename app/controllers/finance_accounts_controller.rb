class FinanceAccountsController < ApplicationController
  def create
    @finance_account = FinanceAccountBuilder.new(finance_account_params).as_finance_account
    respond_to do |format|
      if @finance_account.save
        format.html { redirect_to dashboard_url, notice: 'finance_account was successfully created.' }
        format.json { render action: 'show', status: :created, location: @finance_account }
      else
        format.html { render action: 'new' }
        format.json { render json: @finance_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @finance_account_builder = FinanceAccountBuilder.new(:nil => nil)
  end

  private

  def finance_account_params
    params.require(:finance_account).permit(:plaid_type, :username, :password, :email)
  end
end

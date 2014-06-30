class TransactionsController < ApplicationController

  def create
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to dashboard_url, notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end


  private

  def transaction_params
    params.require(:transaction).permit(:account_type, :date, :amount, :account)
  end
end

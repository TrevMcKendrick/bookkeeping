class EntriesController < ApplicationController
  def show
  end

  def create
    @entry = EntryBuilder.new(entry_params).as_entry(current_user)
    respond_to do |format|
      if @entry.save
        format.html { redirect_to dashboard_url, notice: 'Journal entry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @entry }
      else
        format.html { render action: 'new' }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:amount, :date, :debit, :credit)
  end
end

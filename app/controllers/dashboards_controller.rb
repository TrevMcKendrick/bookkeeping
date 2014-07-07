class DashboardsController < ApplicationController
  def show
    @entrybuilder = EntryBuilder.new(:nil => :nil)
    @user = current_user
  end
end

class DashboardsController < ApplicationController
  def show
    @entrybuilder = EntryBuilder.new(:nil => :nil)
  end
end

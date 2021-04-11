class DashboardController < ApplicationController
  def index
    @properties = Property.all
    @my_properties = current_account.properties
  end
end

class PublicController < ApplicationController
  def main
    @properties = Property.latest[0..5]
  end

  def my_properties
    @properties = Property.all
    @my_properties = current_account.properties
  end
end

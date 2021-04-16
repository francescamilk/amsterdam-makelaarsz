class PublicController < ApplicationController
  def main
    @latest_properties = Property.latest[0..7]
    
    # if account_signed_in?
    #   redirect_to dashboard_path, flash: { success: "Succesfully signed in. Welcome to Amsterdam Makelaars!" } and return
    # end
  end

  def my_properties
    @properties = Property.all
    @my_properties = current_account.properties
  end
end

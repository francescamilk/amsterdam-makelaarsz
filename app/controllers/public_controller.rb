class PublicController < ApplicationController
  def main
    @latest_properties = Property.latest[0..7]
    
    if account_signed_in? && current_account.admin?
      redirect_to accounts_path
    end
  end

  def my_properties
    @properties = Property.all
    @my_properties = current_account.properties
  end

  def contacts
  end
end

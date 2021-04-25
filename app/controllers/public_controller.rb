class PublicController < ApplicationController
  def main
    @latest_properties = Property.latest[0..7]
    
    if account_signed_in? && current_account.admin?
      redirect_to accounts_path
    end
  end

  def contacts
  end
end

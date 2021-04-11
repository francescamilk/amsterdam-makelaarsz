class PublicController < ApplicationController
  def main
    @properties = Property.latest[0..5]
  end
end

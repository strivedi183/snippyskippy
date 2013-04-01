class MController < ApplicationController
 #before_filter upload check if stylist
  layout 'mobile'

  def index
  end

  def upload
    @media = Medium.new
  end


end
class MController < ApplicationController
 #before_filter upload check if stylist
  layout 'mobile'

  def index
  end

  def new
    @media = Medium.new
    @stylist = Stylist.find(@auth.stylist.id)
  end



end
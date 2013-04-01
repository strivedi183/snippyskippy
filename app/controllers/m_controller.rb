class MController < ApplicationController
 #before_filter upload check if stylist
  layout 'mobile'

  def index
  end

  def new
    @medium = Medium.new
    @stylist = Stylist.find(@auth.stylist.id)
  end

  def create
    @stylist = Stylist.find(params[:stylist_id])
    @medium = Medium.create(:stylist_id => @stylist.id)
    @medium.update_attributes(params[:medium])
    @medium = Medium.new
  end

end
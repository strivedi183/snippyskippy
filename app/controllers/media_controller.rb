class MediaController < ApplicationController
  def index
  end
  def create
    @stylist = Stylist.find(params[:stylist_id])
    @medium = Medium.create(:stylist_id => @stylist.id)
    @medium.update_attributes(params[:medium])
    @medium = Medium.new
  end
end


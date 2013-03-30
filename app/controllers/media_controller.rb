class MediaController < ApplicationController
  def index
  end
  def create
    stylist = Stylist.first
    @medium = Medium.create(:stylist_id => stylist.id)
    @medium.update_attributes(params[:medium])
    redirect_to root_path
  end
end


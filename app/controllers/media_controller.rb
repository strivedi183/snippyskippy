class MediaController < ApplicationController
  def index
  end
  def create
    binding.pry
    stylist = Stylist.first
    @medium = Medium.create(:stylist_id => stylist.id)
    binding.pry
    @medium.update_attributes(params[:medium])
    binding.pry
    redirect_to root_path
  end
end


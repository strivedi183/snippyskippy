class SalonsController < ApplicationController

  def new
    @salon = Salon.new
  end

  def create
    @salon = Salon.create(params[:salon])
    @auth.stylist.salon = @salon
    @auth.stylist.save
    @salons = @auth.stylist.salon
    id = @auth.stylist.id
    redirect_to (stylist_path(id))
  end
end
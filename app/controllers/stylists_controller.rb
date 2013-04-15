class StylistsController < ApplicationController
  before_filter :check_if_logged_in

  def new
  end
  def create
  end
  def edit
  end
  def update
  end
  def index
    @user = User.new
    @stylists = Stylist.all
    @salons = Salon.all
  end
  def show
    @user = User.new
    @media = Medium.all #for gallery partial
    @medium = Medium.new #to add new media
    @stylist = Stylist.find(params[:id])
    @salon = Salon.new
    @tags = @media.map(&:tags).flatten.uniq.map(&:tag)
  end
end
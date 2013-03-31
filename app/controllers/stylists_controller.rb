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
    @stylists = Stylist.all
  end
  def show
    @user = User.new
    @medium = Medium.new
    @stylist = Stylist.first
    @salon = Salon.new
  end
end
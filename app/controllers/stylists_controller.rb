class StylistsController < ApplicationController
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
    @medium = Medium.new
    @stylist = Stylist.first
  end
end
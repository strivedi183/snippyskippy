class WelcomeController < ApplicationController

  def index
    @user = User.new
    @stylist = Stylist.first
  end

  def gallery_dev
    @user = User.new
  end

end
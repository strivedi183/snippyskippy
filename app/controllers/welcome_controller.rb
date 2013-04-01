class WelcomeController < ApplicationController
  before_filter :check_for_mobile, :only => [:index]


  def index
    @user = User.new
    @stylist = Stylist.first
  end

  def gallery_dev
    @user = User.new
  end

end
class WelcomeController < ApplicationController
  def index
    @user = User.new
  end

  def gallery_dev
    @user = User.new
  end

end
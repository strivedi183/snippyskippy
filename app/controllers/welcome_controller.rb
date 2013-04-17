class WelcomeController < ApplicationController

  def index
    @user = User.new
    @stylist = Stylist.first
  end

  def gallery_dev
    @user = User.new
    @media = Medium.all
    @tags = @media.map(&:tags).flatten.uniq.map(&:tag)
    @client = @auth
  end

end
class StylistsController < ApplicationController
  before_filter :check_if_logged_in
  layout :resolve_layout

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
  private
  def resolve_layout
    case action_name
    when "index"
      "stylists_index_layout"
    else
      "application"
    end
  end
end
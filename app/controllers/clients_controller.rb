class ClientsController < ApplicationController
  layout 'clientshowpage'
  before_filter :check_if_logged_in

  def show
    @user = User.new
    @client = Client.find(params[:id])
    @media = Medium.all
    @tags = @media.map(&:tags).flatten.uniq.map(&:tag)
  end

  def create
  end

  def update_rank
    rank = params[:rank]
    client_id = params[:id]
    medium_id = params[:medium_id]
    current_favorite = Favorite.where(:client_id => client_id).where(:rank => rank).first
    my_favorite = Favorite.where(:client_id => client_id).where(:medium_id => medium_id).first
    if my_favorite.present?
      my_favorite.rank = rank
      my_favorite.save
    else
     favorite = Favorite.create(:client_id => client_id, :rank => rank, :medium_id => medium_id)
     @auth.client.favorites << favorite
    end
    if current_favorite.present?
      current_favorite.rank = nil
      current_favorite.save
    end

    @user = User.new
    @media = Medium.all
    @tags = @media.map(&:tags).flatten.uniq.map(&:tag)
    @client = Client.find(params[:id])
  end

  def update_favorites
    @user = User.new
    @media = Medium.all
    @tags = @media.map(&:tags).flatten.uniq.map(&:tag)
    client_id = params[:id]
    medium_id = params[:medium_id]
    favorite = Favorite.where(:client_id => client_id).where(:medium_id => medium_id).first
    if favorite.present?
      favorite.delete
    else
      client = Client.find(client_id)
      favorite = Favorite.create(:client_id => client_id, :medium_id => medium_id)
      client.favorites << favorite
    end
    @client = Client.find(params[:id])
  end
end


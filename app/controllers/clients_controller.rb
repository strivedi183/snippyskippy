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

  def clear_ranks
    client_id = params[:id]
    rank_1 = Favorite.where(:client_id => client_id).where(:rank => 1).first
    rank_2 = Favorite.where(:client_id => client_id).where(:rank => 2).first
    rank_3 = Favorite.where(:client_id => client_id).where(:rank => 3).first
    if rank_1.present?
      rank_1.rank = nil
      rank_1.save
    end
    if rank_2.present?
      rank_2.rank = nil
      rank_2.save
    end
    if rank_3.present?
      rank_3.rank = nil
      rank_3.save
    end
    @user = User.new
    @media = Medium.all
    @tags = @media.map(&:tags).flatten.uniq.map(&:tag)
    @client = Client.find(params[:id])
  end

  def update_rank
    rank = params[:rank]
    client_id = params[:id]
    medium_id = params[:medium_id]
    current_favorite = Favorite.where(:client_id => client_id).where(:rank => rank).first
    my_favorite = Favorite.where(:client_id => client_id).where(:medium_id => medium_id).first
    if current_favorite.present?
      current_favorite.rank = nil
      current_favorite.save
    end
    if my_favorite.present?
      my_favorite.rank = rank
      my_favorite.save
    else
     favorite = Favorite.create(:rank => rank, :medium_id => medium_id)
     @auth.client.favorites << favorite
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


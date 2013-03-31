class ClientsController < ApplicationController
  before_filter :check_if_logged_in

  def show
    @user = User.new
    @client = Client.find(params[:id])
    @media = Medium.all
    @tags = @media.map(&:tags).flatten.uniq.map(&:tag)
  end

  def create
  end

end


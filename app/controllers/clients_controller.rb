class ClientsController < ApplicationController
  before_filter :check_if_logged_in

  def show
    @client = Client.find(params[:id])
    @media = Medium.all
    binding.pry
  end

end


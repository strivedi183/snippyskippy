class SessionController < ApplicationController
  def new
  end

  def create
    binding.pry
    @auth = User.where(:email => params[:email]).first
    if @auth.present? && @auth.authenticate(params[:password])
      session[:user_id] = @auth.id
      if @auth.is_client?
        redirect_to client_path(@auth.client.id)
      elsif @auth.is_stylist?
        @stylist = Stylist.find(@auth.stylist.id)
        redirect_to stylist_path(@auth.stylist.id)
      else
        # For Admin
        redirect_to root_path
      end
    else
      session[:user_id] = nil
      redirect_to root_path
    end
    authenticate
  end

  def destroy
    session[:user_id] = nil
    authenticate
    redirect_to root_path
  end
end
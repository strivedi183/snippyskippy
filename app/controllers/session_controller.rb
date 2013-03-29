class SessionController < ApplicationController
  def new
  end

  def create
    @auth = User.where(:email => params[:email]).first
    if @auth.present? && @auth.authenticate(params[:password])
      session[:user_id] = @auth.id
      if @auth.is_client?
        redirect_to client_path
      elsif @auth.is_stylist?
        @stylist = Stylist.find(@auth.userable.id)
        redirect_to root_path
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
class UsersController < ApplicationController

  def create

    @user = User.new(params[:user])
    if params[:address]
      address = params[:address]
      @user.userable = Client.create(address: address)
    else
      @user.userable = Stylist.create
    end

    if @user.save
      redirect_to(root_path)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end



end

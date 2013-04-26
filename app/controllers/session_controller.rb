class SessionController < ApplicationController

  def new
  end

  def create
    @auth = User.where(:email => params[:email]).first
    if @auth.present? && @auth.authenticate(params[:password])
      session[:user_id] = @auth.id
      if @auth.is_client?
        redirect_to client_path(@auth.client.id)
        if @auth.image.present?
          gflash :success => { :title => "Successful Login", :value => "Welcome Back, " + @auth.name.split(" ")[0] + "!" + '<br>' + "You are now logged in.", :image => "#{@auth.image}", :time => 3000, :sticky => false }
        else
          gflash :success => { :title => "Successful Login", :value => "Welcome Back, " + @auth.name.split(" ")[0] + "!" + '<br>' + "You are now logged in.", :time => 3000, :sticky => false },
                 :notice => { :title => "Update Your Profile", :value => @auth.name.split(" ")[0] + ", please update your" + '<br>' + "account by adding a" + '<br>' + "picture of yourself.", :time => 8000, :sticky => false }
        end
      elsif @auth.is_stylist?
        @stylist = Stylist.find(@auth.stylist.id)
        redirect_to stylist_path(@auth.stylist.id)
        if @auth.image.present?
            gflash :success => { :title => "Successful Login", :value => "Welcome Back, " + @auth.name.split(" ")[0] + "!" + '<br>' + "You are now logged in.", :image => "#{@auth.image}", :time => 3000, :sticky => false }
          else
            gflash :success => { :title => "Successful Login", :value => "Welcome Back, " + @auth.name.split(" ")[0] + "!" + '<br>' + "You are now logged in.", :time => 3000, :sticky => false },
                   :notice => { :title => "Update Your Profile", :value => @auth.name.split(" ")[0] + ", please update your" + '<br>' + "account by adding an" + '<br>' + "image of yourself.", :time => 8000, :sticky => false }
        end
      else
        # # For Admin
        # redirect_to root_path
      end
    else
      session[:user_id] = nil
      redirect_to root_path
      gflash :error => { :title => "Login Error", :value => "Something went wrong..." + '<br>' + "Please try logging in again.", :time => 3000, :sticky => false }
    end
    authenticate
  end

  def destroy
    session[:user_id] = nil
    authenticate
    redirect_to root_path
    gflash :success => { :title => "Logout Successful", :value => "Thanks for visiting!" + '<br>' + "You are now logged off.", :time => 3000, :sticky => false }
  end

def m_new
  render :layout => 'mobile'
end

def m_create
    user = User.where(:email => params[:email]).first
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_m_path
    else
  end
end

end
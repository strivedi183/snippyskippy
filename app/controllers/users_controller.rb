class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])
    if params[:address]
      address = params[:address]
      params[:phone]
      phone = params[:phone]
      client = Client.create(:address => address, :phone => phone)
      @user.userable = client
    else
      stylist = Stylist.create
      stylist.bio = params[:bio]
      @user.userable = stylist
      @user.stylist.save
    end

    if @user.save
      session[:user_id] = @user.id
      gflash :success => { :id => "registered", :position => :top_right, :title => "Registration Complete", :value => "Congratulations " + @user.name.split(" ")[0] + "," + '<br>' + "You've created an account!", :time => 5000, :sticky => false },
             :notice => { :id => "welcome", :position => :top_right, :title => "Thank you, " + @user.name.split(" ")[0] + "...", :value => "You'll receive a welcome" + '<br>' + "notification momentarily", :time => 8000, :sticky => false }
      if @user.client.present?
        @user.sendtxt
        @user.sendemail
        redirect_to(client_path(@user.client.id))
      else
        @user.sendemail
        redirect_to(stylist_path(@user.stylist.id))
      end
    else
      gflash :warning => { :title => "Registration Error", :value => "Please complete all" + '<br>' + "registration fields, thanks!", :time => 7000, :sticky => false }
      redirect_to root_path
    end
    if params[:image]
      @user.image = params[:image]
      @user.save
    end
  end

  def update
    @user = User.find(params[:id])
    if params[:address]
      @user.client.address = params[:address]
      @user.client.phone = params[:phone]
    else
      binding.pry
      @user.stylist.bio = params[:bio]
      @user.stylist.save
    end

    if @user.save
      session[:user_id] = @user.id
      gflash :success => { :id => "registered", :position => :top_right, :title => "Registration Complete", :value => "Congratulations " + @user.name.split(" ")[0] + "," + '<br>' + "You've created an account!", :time => 5000, :sticky => false },
             :notice => { :id => "welcome", :position => :top_right, :title => "Thank you, " + @user.name.split(" ")[0] + "...", :value => "You'll receive a welcome" + '<br>' + "notification momentarily", :time => 8000, :sticky => false }
    else
      gflash :warning => { :title => "Registration Error", :value => "Please complete all" + '<br>' + "registration fields, thanks!", :time => 7000, :sticky => false }
      redirect_to root_path
    end
    if params[:image]
      @user.image = params[:image]
      @user.save
    end
    if @user.is_client?
      redirect_to(client_path(@user.client.id))
    elsif @user.is_stylist?
      redirect_to(stylist_path(@user.stylist.id))
    else
    end
  end



end

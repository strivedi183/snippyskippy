module ApplicationHelper
  def login_nav
    nav = ""
    if @auth.present?
      nav += "<li class='name'>#{link_to('Hello, ' +  @auth.name.split(" ")[0] + '!', '#')}</li>"
      nav += "<li class='name'>#{link_to('Browse Styles', client_path(@auth.client.id) )}</li>" if @auth.client.present?
      nav += "<li class='name'>#{link_to('Edit my Profile', '#', :"data-reveal-id" => "client")}</li>" if @auth.client.present?
      nav += "<li class='name'>#{link_to('Edit my Profile', '#', :"data-reveal-id" => "stylist")}</li>" if @auth.stylist.present?
      nav += "<li class='name'>#{link_to('My Home', stylist_path(@auth.stylist))}</li>" if @auth.stylist.present?
      # nav += "<li class='name'><a href='/stylists' id='stylists_index'>Find a Stylist</a></li>" if @auth.client.present?
      nav += "<li class='name'>#{link_to('Logout', '/login', :method => :delete )}</li>"
    else
      nav += "<li class='name'><h1>#{link_to('Login', '#', :id => 'login-form-btn', :'data-dropdown' => 'drop')}</h1></li>"
      nav += "<li class='name' data-position=right data-intro='Click here to Register as either a Client or Stylist.'><h1>#{link_to('Register','#', :'data-reveal-id' => 'register' )}</h1></li>"
    end
  end
end
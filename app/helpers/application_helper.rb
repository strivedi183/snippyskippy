module ApplicationHelper
  def login_nav
    nav = ""
    if @auth.present?
      nav += "<li class='name'>#{link_to('Welcome back ' +  @auth.name + '!', '#')}</li>"
      nav += "<li class='name'>#{link_to('Browse Styles', client_path(@auth.client.id) )}</li>"
      nav += "<li class='name'>#{link_to('Edit my Profile', edit_user_path(@auth.id))}</li>"
      nav += "<li class='name'><a href='/stylists' id='stylists_index'>Find a Stylist</a></li>" if @auth.client.present?
      nav += "<li>#{link_to('Logout', '/login', :method => :delete, :id => 'logout_btn', :class => 'button tiny')}</li>"
    else
      nav += "<li class='name'><h1>#{link_to('Login', '#', :id => 'login-form-btn', :'data-dropdown' => 'drop')}</h1></li>"
      nav += "<li class='name'><h1>#{link_to('Register','#', :'data-reveal-id' => 'register' )}</h1></li>"
    end
  end
end
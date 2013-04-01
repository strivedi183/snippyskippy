module ApplicationHelper
  def login_nav
    nav = ""
    if @auth.present?
      nav += "<li>#{link_to(@auth.name + ' - ' + @auth.userable_type + ' | Logout', '/login', :method => :delete, :id => 'logout_btn')}</li>"
    else
      nav += "<li class='name'><h1>#{link_to('Login', '#', :id => 'login-form-btn', :'data-dropdown' => 'drop')}</h1></li>"
      nav += "<li class='name'><h1>#{link_to('Register','#', :'data-reveal-id' => 'register' )}</h1></li>"
    end
    nav
  end
end


# .fixed
#   %nav.top-bar
#     %ul.title-area.left
#     -if @auth.present?
#       %li.name
#         %h1
#           %a= link_to(@auth.name + ' - ' + @auth.userable_type + ' | Logout', '/login', :method => :delete, :id => 'logout_btn')
#     -if !@auth.present?
#       %li.name
#         %h1
#           %a{"data-dropdown" => "drop", :href => "#"}= 'Login'
#           #drop.f-dropdown.content
#             %li#login_form
#               = form_tag '/login' do
#                 = text_field_tag :email, nil, :autofocus => true, :id => 'email_field', :placeholder => 'Email'
#                 = password_field_tag :password, nil, :id => 'password_field', :placeholder => 'Password'
#                 .login_btn
#                   = submit_tag 'Login', :id => 'login_btn', :class => 'button radius success'
#       %li.name
#         %h1
#           %a{"data-reveal-id" => "register", :href => "#"}= 'Register'
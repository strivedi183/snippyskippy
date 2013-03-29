module ApplicationHelper
  def login_nav
    nav = ""
    if @auth.present?
      nav += "<li>#{link_to(@auth.username + ' | ' + 'Logout', '/login', :method => :delete, :class => 'tiny alert')}</li>"
    else
      nav == ""
    end
    nav
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate
  before_filter :check_for_mobile

  private
  def authenticate
    @auth = (session[:user_id].present?) ? User.find(session[:user_id]) : nil
  end

  def check_if_logged_in
    redirect_to(root_path) if @auth.nil?
  end

# mobile redirect
  def check_for_mobile
    if (request.user_agent =~ /Mobile|webOS/) && (request.user_agent !~ /iPad/)
      prepend_view_path_if_mobile
    end
  end

  def prepend_view_path_if_mobile
    append_view_path Rails.root + 'app' + 'views' + 'm'
  end


end

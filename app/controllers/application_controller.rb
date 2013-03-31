class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate
  # def check_for_mobile
  #   session[:mobile_override] = params[:mobile] if params[:mobile]
  # end
  # def prepare_for_mobile
  #   prepend_view_path Rails.root + 'app' + 'views_mobile'
  # end
  # def mobile_device?
  #   if session[:mobile_override]
  #     session[:mobile_override] == "1"
  #   else
  #     # Season this regexp to taste. I prefer to treat iPad as non-mobile.
  #     (request.user_agent =~ /Mobile|webOS/) && (request.user_agent !~ /iPad/)
  #   end
  # end
  # helper_method :mobile_device?
  private
  def authenticate
    @auth = (session[:user_id].present?) ? User.find(session[:user_id]) : nil
  end

  def check_if_logged_in
    redirect_to(root_path) if @auth.nil?
  end
end

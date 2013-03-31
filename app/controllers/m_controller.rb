class MController < ApplicationController
  def index
    @user = User.new
  end
end
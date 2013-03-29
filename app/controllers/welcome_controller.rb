class WelcomeController < ApplicationController
  def index
    @medium = Medium.new
  end
end
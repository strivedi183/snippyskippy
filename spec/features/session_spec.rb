require 'spec_helper'
require 'features/shared/login_helper'
include LoginHelper

describe 'Session' do
  describe 'GET /' do
    it 'displays login link' do
      visit root_path
      page.should have_link('Login')
    end
  end

  describe 'GET /login' do
    it 'displays the login form' do
      visit root_path
      click_link('Login')
      page.should have_button('Login')
    end
  end

  describe 'POST /login' do
    let(:user) {FactoryGirl.create(:generic_user)}

    it 'logs the user into the system if credentials are correct' do
      login_to_system(user)
      page.find('#login_btn').visible? != true
    end

    it 'does not log the user into the system if credentials are incorrect' do
      visit root_path
      click_link('Login')
      fill_in('Email', :with => user.email)
      fill_in('Password', :with => 'b')
      click_button('Login')
      page.should have_button('Login')
    end
  end

  # describe 'DELETE /login' do
  #   it 'logs the user off the system' do
  #     client = FactoryGirl.create(:client)
  #     login_to_system(client.user)
  #     click_link('Logout')
  #     page.should_not have_link('Logout')
  #     page.should have_link('Login')
  #     visit root_path
  #     page.should_not have_link('Logout')
  #     page.should have_link('Login')
  #   end
  # end

  describe 'close login form drop down' do
    it 'removes the login form' do
      visit root_path
      click_link('Login')
      click_link('Login')
      page.find('#login_btn').visible? != true
    end
  end
end
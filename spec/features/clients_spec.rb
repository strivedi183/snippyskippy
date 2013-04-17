require 'spec_helper'
require 'features/shared/login_helper'
include LoginHelper

describe 'Client' do
  describe 'GET /login' do
    it 'displays the login form' do
      visit root_path
      click_link('Login')
      page.should have_button('Login')
    end
  end

  describe 'GET /users/new' do
    it 'displays register link' do
      visit root_path
      page.should have_link('Register')
    end

    it 'shows the registration form when the Registration link is clicked', :js => true do
      visit root_path
      click_link('Register')
      page.should have_link('Client')
    end

    it 'clears the form when the X button is clicked' do
      visit root_path
      click_link('Register')
      page.should have_link('Client')
      click_link('Register')
      page.find('#client').visible? != true
    end
  end

  describe 'POST /users/create' do
    it 'creates a new client', :js => true do
      visit root_path
      click_link('Login')
      fill_in('client_name', :with => 'joseph')
      fill_in('client_email', :with => 'bob@gmail.com')
      fill_in('address', :with => 'NYC')
      fill_in('client_password', :with => 'a')
      fill_in('client_password_confirmation', :with => 'a')
      fill_in('client_phone', :with => "#{ENV['PHONE']}")
      click_button('Login')
      page.should have_link('Logout')
      expect(User.first.name).to eq 'bob'
    end
  end

  describe 'POST /login' do
    let(:user) {FactoryGirl.create(:client_user)}

    it 'logs the user into the system if credentials are correct' do
      login_to_system(user)
      page.should_not have_link('Login')
    end

    it 'does not log the user into the system if credentials are incorrect' do
      visit root_path
      click_link('Login')
      fill_in('email_field', :with => user.email)
      fill_in('password_field', :with => 'b')
      click_button('Login')
      page.should have_button('Login')
    end
  end

  describe 'DELETE /login' do
    it 'logs the user off the system' do
      client = FactoryGirl.create(:client_user)
      login_to_system(client)
      page.should have_text('Logout') #userable_type needs to get added here
      # click_link('client | Logout')
      # page.should have_link('Login')
      # visit root_path
      # page.should have_link('Login')
    end
  end

  describe 'close login form drop down' do
    it 'removes the login form' do
      visit root_path
      click_link('Login')
      click_link('Login')
      page.find('#login_btn').visible? != true
    end
  end
end
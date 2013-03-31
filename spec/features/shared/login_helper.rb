module LoginHelper
  def login_to_system(user)
    visit root_path
    click_link('Login')
    fill_in('email_field', :with => user.email)
    fill_in('password_field', :with => user.password)
    click_button('Login')
  end
end
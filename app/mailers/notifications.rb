class Notifications < ActionMailer::Base
  def registration_message(name, email)
    mail :to => email, :from => ENV['EMAIL'], :subject => "#{name}, Your Registration is Complete!"
  end
end
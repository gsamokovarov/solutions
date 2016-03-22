class UserMailer < ApplicationMailer
  def welcome_mail(user)
    mail to: user.email
  end
end

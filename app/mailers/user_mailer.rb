class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    # We stock the parameter user in an instance variable
    @user = user 

    # We stock the url to use it in the e-mail
    @url  = 'https://monsite.fr' 

    # We use mail to send a mail to a specific address with 
    # a custom subject
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

end

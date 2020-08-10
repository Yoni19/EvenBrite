class AttendanceMailer < ApplicationMailer

  default from: 'no-reply@monsite.fr'
  
  def participation_email(user, organizer, event)
    # We stock the parameter user in an instance variable
    @user = user 
    @organizer = organizer
    @event = event

    # We stock the url to use it in the e-mail
    @url  = 'https://monsite.fr' 

    # We use mail to send a mail to a specific address with 
    # a custom subject
    mail(to: @organizer.email, subject: 'Un nouveau participant rejoint votre évènement!') 
  end
end


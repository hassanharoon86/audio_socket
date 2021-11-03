class AuditionMailer < ApplicationMailer
  default from: 'no-reply@audiosocket.com'

  def audition_assign(email, audition)
    @email = email
    @audition = audition

    mail to: email, subject: 'Audtion assigned to you - Take a look'
  end
end

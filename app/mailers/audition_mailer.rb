class AuditionMailer < ApplicationMailer
  default from: 'no-reply@audiosocket.com'

  def audition_assign(email, audition)
    @email = email
    @audition = audition

    mail to: email, subject: 'Audtion assigned to you - Take a look'
  end

  def audition_update(audition, content)
    @audition = audition
    @content = content

    mail to: @audition.email, subject: 'Your audition update at audiosocket.com'
  end
end

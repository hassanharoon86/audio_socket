class DeviseMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'

  def invitation_instructions(resource, token, options)
    # byebug
    @content = options[:content]
    @audition = options[:audition]

    super
  end
end

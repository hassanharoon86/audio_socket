# frozen_string_literal: true

class DeviseMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'

  def invitation_instructions(resource, token, options)
    @content = options[:content]

    super
  end
end

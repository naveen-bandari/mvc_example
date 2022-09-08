# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def send_an_email_alert(id)
    user = User.find(id)
    puts "=================#{user}========"
    # user.asdfasfs
  end
end

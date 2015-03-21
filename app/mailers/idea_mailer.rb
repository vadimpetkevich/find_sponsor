class IdeaMailer < ApplicationMailer
  include Sidekiq::Mailer

  def published_email(investor, idea)
    mail(to: 'petkevich.minsk@gmail.com', subject: 'New Published Idea')
  end
end

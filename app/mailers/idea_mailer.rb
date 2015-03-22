class IdeaMailer < ApplicationMailer
  include Sidekiq::Mailer

  def published_email(investor, idea)
    @investor = investor
    @idea = idea
    mail(to: @investor.email, subject: 'New Published Idea')
  end
end

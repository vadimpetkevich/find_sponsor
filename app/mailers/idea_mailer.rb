class IdeaMailer < ApplicationMailer
  include Sidekiq::Worker
  sidekiq_options queue: 'mailer'

  def published_email(investor, idea)
    @investor = investor
    @idea = idea
    mail(to: @investor.user.email, subject: 'New Published Idea').deliver
  end
end

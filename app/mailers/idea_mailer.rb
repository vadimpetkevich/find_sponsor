class IdeaMailer < ApplicationMailer
  def published_email(user)
    @user = user
    mail(to: @user.email, subject: 'New Published Idea')
  end
end

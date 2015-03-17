class IdeaMailer < ApplicationMailer
  def published_email(user)
    puts 'here' * 100
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

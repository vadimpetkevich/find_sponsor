class HomeController < ApplicationController
  def show
    if user_signed_in?
      case current_user.role
      when 'Investor'
        render 'investor'
      when 'Businessman'
        render 'investor'
      end
    else
      render 'guest'
    end
  end
end

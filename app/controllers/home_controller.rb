class HomeController < ApplicationController
  def show
    if user_signed_in?
      case current_user.role
      when 'Investor'
        redirect_to ideas_url and return
      when 'Businessman'
        redirect_to investors_url and return
      end
    else
      render 'guest'
    end
  end
end

class HomeController < ApplicationController
  layout 'home'

  def index

    if user_signed_in?
      redirect_to action: :index, controller: :marks
    end
  end
end

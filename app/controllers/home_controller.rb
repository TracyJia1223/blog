class HomeController < ApplicationController
  def index
  end

  def home
    redirect_to posts_path if logged_in?
  end
  
end

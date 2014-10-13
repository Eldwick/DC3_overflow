class WelcomeController < ApplicationController
  def index
    @questions = Question.limit(3)
    @users = User.all
    @categories = Category.all
    @user_id = session[:user_id]
  end
end

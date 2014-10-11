class WelcomeController < ApplicationController
  def index
    @questions = Question.all
    @users = User.all
    @category = Category.all
    @user_id = session[:user_id]
  end
end

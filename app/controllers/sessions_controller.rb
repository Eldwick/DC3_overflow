class SessionsController < ApplicationController
  def new
    @id = session[:user_id]
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    puts params[:email]

    if user
      puts "passed"
      session[:user_id] = user.id
      redirect_to "/", :notice => "Signed up!"
    else
      puts "failed"
      session[:user_id] = "failed"
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

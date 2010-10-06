class UsersController < ApplicationController
  def new
    @title = "Sign up"
  end
  
  def show
    @user = User.find(params[:id])
    # no x site scripting possible: name is already escaped
    @title = @user.name

  end


end

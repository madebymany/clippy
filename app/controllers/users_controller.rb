class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
  end
  
  def show
    @user = User.find(params[:id])
    @clips = @user.clips
  end
end

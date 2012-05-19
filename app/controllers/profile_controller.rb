class ProfileController < ApplicationController
  
  before_filter :authenticate_user!
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      render :action => 'edit'
    else
      render :action => 'edit'
    end
  end
end

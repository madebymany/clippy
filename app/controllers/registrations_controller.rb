class RegistrationsController < Devise::RegistrationsController
  
  # def edit
  #   @user = current_user
  # end
  # 
  # def update
  #   @user = current_user
  #   render :action => root_path
  # end
  
  def create
    super
    session[:omniauth] = nil unless @user.new_record? 
  end

  private
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end
end
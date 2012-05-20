class Api::V1::BaseController < ApplicationController
  
  oauthenticate :interactive=>false
  respond_to :json
  
  #before_filter :authenticate_user!
  before_filter :correct_user, only: :destroy
  
  private

    def correct_user
      @clip = current_user.clips.find_by_id(params[:id])
      redirect_to root_path if @clip.nil?
    end
end

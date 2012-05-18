class Api::V1::ClipsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :correct_user,   only: :destroy
  
  def index
    if signed_in?
      @clip = current_user.clips.build

      respond_to do |format|
        format.json { render json: @clips }
      end
    end
  end
  
end
class Api::V1::ClipsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :correct_user,   only: :destroy
  
  def index
    @clips = Clip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clips }
    end
  end

  def create
    @clip = current_user.clips.build(params[:clip])

    respond_to do |format|
      if @clip.save
        format.html { redirect_to root_path, notice: 'Clip was successfully created.' }
        format.json { render json: @clip, status: :created, location: @clip }
      else
        @feed_items = []
        format.html { render action: "new" }
        format.json { render json: @clip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @clip = Clip.find(params[:id])
    @clip.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Clip was deleted.' }
      format.json { head :no_content }
    end
  end
  
  private

    def correct_user
      @clip = current_user.clips.find_by_id(params[:id])
      redirect_to root_path if @clip.nil?
    end
end

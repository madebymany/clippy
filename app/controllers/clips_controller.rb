class ClipsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :correct_user,   only: :destroy
  
  # GET /clips
  # GET /clips.json
  def index
    @clips = Clip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clips }
    end
  end

  # GET /clips/1
  # GET /clips/1.json
  # def show
  #   @clip = Clip.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @clip }
  #   end
  # end

  # GET /clips/new
  # GET /clips/new.json
  # def new
  #   @clip = Clip.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @clip }
  #   end
  # end

  # GET /clips/1/edit
  # def edit
  #   @clip = Clip.find(params[:id])
  # end

  # POST /clips
  # POST /clips.json
  def create
    @clip = current_user.clips.build(params[:clip])
    #@clip = Clip.new(params[:clip])

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

  # PUT /clips/1
  # PUT /clips/1.json
  # def update
  #   @clip = Clip.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @clip.update_attributes(params[:clip])
  #       format.html { redirect_to @clip, notice: 'Clip was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @clip.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /clips/1
  # DELETE /clips/1.json
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

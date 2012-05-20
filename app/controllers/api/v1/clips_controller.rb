class Api::V1::ClipsController < Api::V1::BaseController
  
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

end

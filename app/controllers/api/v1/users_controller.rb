class Api::V1::UsersController < Api::V1::BaseController
  
  def show
    render :json => User.find(params[:id]).to_json(:except => [ :user_id, :email ]) #, :include => { :user => { :only => :username }} ) #, :callback => params[:callback]
  end
  
  def feed
    @user = User.find(params[:id])
    @clip = @user.clips.build
    @feed_items = @user.feed
    render :json => @feed_items.to_json(:except => [ :user_id, :updated_at ]) #, :include => { :user => { :only => :username }} ) #, :callback => params[:callback]
  end
  
  def create
    @clips = current_user.clips.build
    respond_to do |format|
      format.json { render json: @clips }
    end
  end
  
  def clips
    @clips = current_user.clips.build
    respond_to do |format|
      format.json { render json: @clips }
    end
  end
  
end
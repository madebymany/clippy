class HomeController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    if signed_in?
      @clip = current_user.clips.build
      @feed_items = current_user.feed
    end
  end
end

class TrailsController < ApplicationController
  before_action :authenticated?
  
  def index
    @trails = Trail.all.limit(10)
  end
  
  def show
    @trail = Trail.find(params[:id])
    @playlists = @trail.playlists.includes(:user)
  end
end
class PlaylistsController < ApplicationController
  before_action :authenticated?
  before_action :set_trail
  before_action :set_playlist, only: [:destroy]
  
  def new
    @playlist = Playlist.new
  end
  
  def create
    @playlist = @trail.playlists.build(playlist_params)
    @playlist.user = current_user  # Set the owner
    
    if @playlist.save
      redirect_to @trail, notice: "Playlist created! 🤘"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    if @playlist.user == current_user
      @playlist.destroy
      redirect_to @trail, notice: "Playlist deleted."
    else
      redirect_to @trail, alert: "Only the playlist owner can delete it!"
    end
  end
  
  private
  
  def set_trail
    @trail = Trail.find(params[:trail_id])
  end
  
  def set_playlist
    @playlist = @trail.playlists.find(params[:id])
  end
  
  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
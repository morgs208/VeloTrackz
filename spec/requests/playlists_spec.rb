require 'rails_helper'

RSpec.describe "Playlists", type: :request do
  let(:user) { User.create!(email_address: "test@example.com", password: "password123") }
  let(:other_user) { User.create!(email_address: "other@example.com", password: "password123") }
  let(:trail) { Trail.create!(name: "Test Trail", latitude: 40.0, longitude: -120.0, description: "Test") }
  
  # Helper to sign in a user
  def sign_in_as(user)
    post session_url, params: { email_address: user.email_address, password: "password123" }
  end
  
  describe "POST /trails/:trail_id/playlists" do
    context "when authenticated" do
      before { sign_in_as(user) }
      
      it "creates a playlist owned by current user" do
        expect {
          post trail_playlists_path(trail), params: { playlist: { name: "Uphill Grind" } }
        }.to change(Playlist, :count).by(1)
        
        playlist = Playlist.last
        expect(playlist.user).to eq(user)
        expect(playlist.trail).to eq(trail)
        expect(playlist.name).to eq("Uphill Grind")
      end
      
      it "redirects to trail show page on success" do
        post trail_playlists_path(trail), params: { playlist: { name: "Uphill Grind" } }
        expect(response).to redirect_to(trail_path(trail))
      end
      
      it "re-renders form when name is blank" do
        post trail_playlists_path(trail), params: { playlist: { name: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    
    context "when not authenticated" do
      it "redirects to sign in" do
        post trail_playlists_path(trail), params: { playlist: { name: "Uphill Grind" } }
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
  
  describe "DELETE /trails/:trail_id/playlists/:id" do
    let!(:playlist) { Playlist.create!(name: "My Playlist", user: user, trail: trail) }
    
    context "when owner is logged in" do
      before { sign_in_as(user) }
      
      it "deletes the playlist" do
        expect {
          delete trail_playlist_path(trail, playlist)
        }.to change(Playlist, :count).by(-1)
      end
      
      it "redirects to trail page" do
        delete trail_playlist_path(trail, playlist)
        expect(response).to redirect_to(trail_path(trail))
      end
    end
    
    context "when non-owner is logged in" do
      before { sign_in_as(other_user) }
      
      it "does NOT delete the playlist" do
        expect {
          delete trail_playlist_path(trail, playlist)
        }.to_not change(Playlist, :count)
      end
      
      it "redirects with error message" do
        delete trail_playlist_path(trail, playlist)
        expect(response).to redirect_to(trail_path(trail))
        follow_redirect!
        expect(response.body).to include("Only the playlist owner")
      end
    end
    
    context "when not authenticated" do
      it "redirects to sign in" do
        delete trail_playlist_path(trail, playlist)
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end
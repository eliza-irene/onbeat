require 'spec_helper'

describe SongsController, type: :controller do 
  before do
    User.destroy_all
  end

  let(:user) { FactoryGirl.create(:user)}
  before { sign_in user, no_capybara: true }

  describe "POST create / save a song to playlist" do
    let(:playlist) { FactoryGirl.create(:playlist, user: user) }   
    context "with valid attributes" do
      it "saves the new song" do
        expect {
          post :create, song: FactoryGirl.attributes_for(:song).merge({ playlist_id: playlist.id })
        }.to change(Song, :count).by(1)
      end

      it "redirects to :index / search page" do
        post :create, song: FactoryGirl.attributes_for(:song).merge({ playlist_id: playlist.id })
        expect(response).to redirect_to(songs_path)
      end
    end
  end
end
require 'spec_helper'

describe SongsController, type: :controller do 
  before do
    User.destroy_all
  end

  let(:user) { FactoryGirl.create(:user)}
  before { sign_in user, no_capybara: true }

  describe "POST create / save a song to playlist" do
    let(:song) { FactoryGirl.create(:song) }
    
    context "with valid attributes" do
      it "saves the new song to @song" do
        expect {
          post :create, song: FactoryGirl.attributes_for(:song)
        }.to change(Song, :count).by(1)
      end

      it "redirects to :index/ search page" do
        post :create, song: FactoryGirl.attributes_for(:song)
        expect(response).to redirect_to(songs)
      end
    end

    # context "with invalid attributes" do
    #   it "does not save the new Playlist to @playlist" do
    #     expect{
    #       post :create, playlist: { name: " " }
    #     }.to_not change(Playlist, :count)
    #   end

    #   it "re-renders :new" do
    #     post :create, playlist: { name: " " }
    #     expect(response).to render_template(:new)
    #   end
    # end
  end
end
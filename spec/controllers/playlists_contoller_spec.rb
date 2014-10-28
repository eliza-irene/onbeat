require 'spec_helper'

describe PlaylistsController, type: :controller do 

  describe "GET show / playlist view page" do
    let(:playlist) { FactoryGirl.create(:playlist)}

    it "renders :show" do
      get :show, id: playlist.id
      expect(response).to render_template(:show)
    end

    it "assigns requested playlist to @playlist" do
      get :show, id: playlist.id
      assigns(:playlist).should eq(playlist)
    end
  end

  describe "GET new / initiate a new playlist" do
    it "renders :new" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns new playlist to @playlist" do
      get :new
      assigns(:playlist).should be_a_new(Playlist)
    end
  end

  describe "POST create / save an initiated playlist" do
    context "with valid attributes" do
      it "saves the new playlist to @playlist" do
        expect {
          post :create, playlist: FactoryGirl.attributes_for(:playlist)
        }.to change(Playlist, :count).by(1)
      end

      it "redirects to :show / playlist view page" do
        post :create, playlist: FactoryGirl.attributes_for(:playlist)
        last_playlist = Playlist.last
        expect(response).to redirect_to(last_playlist.id)
      end
    end

    context "with invalid attributes" do
      it "does not save the new Playlist to @playlist" do
        expect{
          post :create, playlist: { name: " " }
        }.to_not change(Playlist, :count)
      end

      it "re-renders :new" do
        post :create, playlist: { name: " " }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET edit / edit playlist" do
    let(:playlist) { FactoryGirl.create(:playlist) }

    it "renders :edit" do
    get :edit, id: playlist.id 
    expect(response).to render_template(:edit)
    end

    it "assigns requested playlist to @playlist" do
      get :edit, id: playlist.id
      assigns(:playlist).should eq(playlist)
    end
  end

  describe "GET index / displays all playlists" do   
    before { Playlist.destroy_all } 

    let(:first_playlist)  { FactoryGirl.create(:playlist, name: "Run") }
    let(:second_playlist) { FactoryGirl.create(:playlist, name: "Yoga") }

    it "renders :index" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns all playlists to @playlists as an array" do
      get :index
      expect(assigns(:playlists)).to eq( [first_playlist, second_playlist] ) 
    end
  end
end
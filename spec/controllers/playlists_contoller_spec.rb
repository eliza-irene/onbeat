require 'spec_helper'

describe PlaylistsController, type: :controller do 
  before do
    User.destroy_all
  end

  let(:user) { FactoryGirl.create(:user)}
  before { sign_in user, no_capybara: true }

   describe "GET show / playlist view page" do
     let(:playlist) { FactoryGirl.create(:playlist) }

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
     let(:playlist) { FactoryGirl.create(:playlist) }

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
          post :create, playlist: FactoryGirl.attributes_for(:playlist, name: " ")
        }.to_not change(Playlist, :count)
      end

      it "re-renders :new" do
        post :create, playlist: FactoryGirl.attributes_for(:playlist, name: " ")
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

 describe 'PUT update / changes name of playlist' do 
   let(:playlist) { FactoryGirl.create(:playlist, name: "Weights") }

   context "valid attributes" do

     it "changes @playlist's name attribute" do
       put :update, id: playlist.id, playlist: FactoryGirl.attributes_for(:playlist, name: "Running")
       playlist.reload
       expect(playlist.name).to eq("Running")
     end

     it "re-directs to :show" do
       post :update, id: playlist.id, playlist: FactoryGirl.attributes_for(:playlist, name: "Running")
       last_playlist = Playlist.last
       expect(response).to redirect_to(playlist_path(last_playlist.id))
     end
   end

   context "invalid attributes" do

     it "does not change @playlist's name attribute" do
       put :update, id: playlist.id, playlist:{ name: " " }
       playlist.reload
       expect(playlist.name).to eq("Weights")
     end

     it "re-renders :edit" do
       put :update, id: playlist.id, playlist:{ name: " " }
       expect(response).to render_template(:edit)
     end
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

 describe 'DELETE destroy / deletes whole playlist' do
   let!(:playlist) { FactoryGirl.create(:playlist) }

   it "deletes the requested playlist" do
     expect {
       delete :destroy, id: playlist.id
     }.to change(Playlist, :count).by(-1)
   end

   it "re-directs to :index" do
     delete :destroy, id: playlist.id
     expect(response).to redirect_to(playlists_path)
   end
 end
end
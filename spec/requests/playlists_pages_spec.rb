require 'spec_helper'

describe "playlists_pages" do 

  subject { page }

  describe "show page GET /playlists/:id" do
    let(:my_playlist) { FactoryGirl.create(:playlist) }

    before { visit playlist_path(my_playlist.id) }
    it { should have_title("on.BEAT | Workout") }

    it { should have_selector('h2', "View Playlist:") }
    it { should have_selector('p', "Workout") }   
  end

  describe "new page GET /playlists/new" do
    before { visit new_playlist_path }
  
    it { should have_title("on.BEAT | New Playlist") }
    it { should have_selector('h1', text: "New Playlist") }

    describe "create POST /playlists" do
      let(:submit) { "Create Playlist" }
    
      context "valid information" do
        before do
          visit new_playlist_path
          fill_in "Name", with: "Yoga"
        end

        it "creates playlist" do
          expect { click_button submit }.to change(Playlist, :count).by(1)
        end

        describe "after submission" do
          before { click_button submit }

          it { should have_title("on.BEAT | Yoga")}
          it { should have_selector('p', text: "Yoga")}
        end
      end

      context "invalid information" do
        it "does not create a playlist" do
          expect { click_button submit }.not_to change(Playlist, :count)
        end

        describe "after submission" do
          before { click_button submit}

          it {should have_title('on.BEAT | New Playlist')}
          it {should have_content('error')}
        end
      end
    end
  end
end
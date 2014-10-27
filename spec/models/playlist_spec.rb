require 'spec_helper'

describe Playlist do
  
  let(:user) { FactoryGirl.create(:user) }  
  before { @playlist = Playlist.new(name: "Running Mix", user_id: user.id) }
  

  subject { @playlist }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }

  it { should be_valid }


  describe "validations" do

    describe "name" do

      context "not present" do
        before { @playlist.name = " " }
        it { should_not be_valid}
      end

      context "too long" do
        before { @playlist.name = "a" * 51 }
        it { should_not be_valid}
      end

      context "too short" do
        before { @playlist.name = "a" * 2 }
        it { should_not be_valid}
      end
    end

    describe "when not signed in"  do
      before { @playlist.user_id = nil }
      it { should_not be_valid }
    end
  end
end
  


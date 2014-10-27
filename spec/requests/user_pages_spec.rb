require 'spec_helper'

describe "user pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_title('on.BEAT | Sign Up') }
    it { should have_selector('h1', text: "Sign Up") }

    describe "signup" do
      before { visit signup_path }
      let(:submit) { "Ready to Rock!"}

      context "valid information" do
        before do
          User.destroy_all
          fill_in "Name", with: "Liz"
          fill_in "Email", with: "elizabeth.korthof@gmail.com"
          fill_in "Password", with: "foobar"
          fill_in "Password confirmation", with: "foobar"
        end

        it  "creates user" do
          expect { click_button submit }.to change(User, :count).by(1)
        end

        describe "after submission" do
          before { click_button submit }

          it { should have_title("on.BEAT | Liz") }
          it { should have_selector('h1', text: "Liz") }
        end
      end
    end

    describe "show page" do    
      before do
        User.destroy_all
        user = FactoryGirl.create(:user, name: "Liz", email: "elizabeth.korthof@gmail.com")
        visit user_path(user.id)
      end

      it { should have_title("on.BEAT | Liz") }
      it { should have_selector('h1', "Liz") }
    end
  end
end
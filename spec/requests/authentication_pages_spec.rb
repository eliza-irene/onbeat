require 'rails_helper'

RSpec.describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_title("on.BEAT | Sign In") }
    it { should have_selector('h1', "Sign In") }

    describe "signin POST /sessions" do
      before do
        User.destroy_all
        @user = FactoryGirl.create(:user)
      end


      context "valid info" do
        before do
          fill_in "Email",    with: @user.email
          fill_in "Password", with: @user.password
          click_button "Ready to Rock!"
        end

        it { should_not have_link('Sign In', href: signin_path) }
        it { should_not have_link('Sign Up', href: signup_path) }
      end

      context "invalid info" do
        before do
          click_button "Ready to Rock!"
        end

        it { should have_link('Sign In', href: signin_path) }
        it { should have_link('Sign Up', href: signup_path) }
      end
    end
  end
end


  
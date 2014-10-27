require 'spec_helper'

describe StaticPagesController, type: :controller do 

  describe "home page" do
    it "renders home" do
      get :home
      expect(response).to render_template(:home)
    end
  end

  describe "about page" do
    it "renders about" do
      get :about
      expect(response).to render_template(:about)
    end
  end
end
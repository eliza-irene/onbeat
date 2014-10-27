require 'spec_helper'

describe User do 

  before { @user = User.new(name: "Liz Korthof", email: "elizabeth.korthof@google.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "name" do  
    context "when not present" do
      before { @user.name = " " }
      it { should_not be_valid }
    end
  end

  describe "email" do
    context "when not present" do
      before { @user.email = " " }
      it { should_not be_valid }
    end
  end



  
end

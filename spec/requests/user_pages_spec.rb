require 'spec_helper'

describe "User pages" do
  subject { page }
  describe "signup page" do
    before { visit signup_path }
    it { should have_selector('h1', text: "Sign up") }
    it { should have_selector("title", text: "Sign up") }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_selector('h1', text: user.name) }
    it { should have_selector("title", text: user.name) }
  end

  describe "signup" do
    subject{ visit signup_path}
    let(:sumbit) {"Create my account"}

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button sumbit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "exaple@Example.com"
        fill_in "Password", wiht: "123456"
        fill_in "Confirmation", with: "123456"
      end

      it "should create a user" do
        expect { click_button sumbit }.to change(User, :count).by(1)
      end
    end
  end

end
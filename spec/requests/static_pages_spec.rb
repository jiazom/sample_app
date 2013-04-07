require 'spec_helper'

describe "StaticPages" do
    subject { page }
    # page about the home page
    describe "Home page" do
      before { visit root_path }
      it { page.should have_selector('h1', text: "Sample App") }
      it { page.should have_selector("title", text: full_title('')) }
      it {page.should have_selector("title",text: "| Home")}
    end

    #page about the contact page
    describe "Contact page" do
      before { visit contact_path }
      it { page.should have_selector('h1', text: "Contact") }
      it { page.should have_selector("title", text: full_title('Contact')) }
      it { page.should have_selector("title", text: "| Contact") }
    end

    #page about the help page
    describe "Help page" do
      before { visit help_path }
      it { page.should have_selector('h1', text: "Help") }
      it { page.should have_selector("title", text: full_title('Help')) }
      it { page.should have_selector("title", text: "| Help") }
    end

    #page about the about page
    describe "About page" do
      before { visit about_path }
      it { page.should have_selector('h1', text: "About Us") }
      it { page.should have_selector("title", text: full_title('About Us')) }
      it { page.should have_selector("title", text: "| About Us")}
    end
end
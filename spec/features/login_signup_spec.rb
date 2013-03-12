require 'spec_helper'

describe "Login" do
  it "should show correct welcome with anonymous" do
    visit '/'
    page.should have_content "Welcome Anonymous User"
    page.should have_content "Login"
    page.should have_content "Sign up"

    # an anonymous user should have been created
    User.count.should == 1
    user = User.first
    user.name.should == "Anonymous User"
    user.signed_up.should == false
  end

  it "should fail to login as no user exists" do
    visit '/login'
    page.find("h2").should have_content('Login')

    fill_in 'session_email', with:"nobody@foo.com"
    fill_in 'session_password', with:"bad-passwd"
    click_button "Sign in"

    page.should have_content "No account found with that email. Maybe you haven't signing up yet?"
  end

  it "with incorrect credentials" do
    user = FactoryGirl.create(:user_vlod)

    visit '/login'
    fill_in 'session_email', with:"vlod@foo.com"
    fill_in 'session_password', with:"bad-password"
    click_button "Sign in"

    page.should have_content "Incorrect email/password combination"
  end

  it "with correct credentials" do
    user = FactoryGirl.create(:user_vlod)

    visit '/login'
    fill_in 'session_email', with:"vlod@foo.com"
    fill_in 'session_password', with:"foo123"
    click_button "Sign in"
    page.should have_content "Logged in as Vlod"

    # last sign_in_at should be updated
    user = User.find(user.id)
    user.should_not == nil
    user.last_sign_in_at.should_not == nil
  end

  it "should logout correctly" do
    user = FactoryGirl.create(:user_vlod)

    visit '/login'
    fill_in 'session_email', with:"vlod@foo.com"
    fill_in 'session_password', with:"foo123"
    click_button "Sign in"
    page.should have_content "Logged in as Vlod"

    visit '/logout'
    page.should have_content "Welcome back, Vlod"
    page.should have_content "Login"
    page.should have_content "Sign up"
  end
end

describe "Signup" do
  it "should create an account" do
    visit '/signup'
    fill_in 'user_name',     with:"rach"
    fill_in 'user_email',    with:"rach@foo.com"
    fill_in 'user_password', with:"bar123"
    fill_in 'user_password_confirmation', with:"bar123"
    click_button "Create my account"

    User.count.should == 1
    user = User.first
    user.name.should  == "rach"
    user.email.should == "rach@foo.com"
    user.signed_up.should == true
  end

  it "should prompt to login, if already logged in previously" do
    user = FactoryGirl.create(:user_vlod)

    visit '/login'
    fill_in 'session_email', with:"vlod@foo.com"
    fill_in 'session_password', with:"foo123"
    click_button "Sign in"
    page.should have_content "Logged in as Vlod"

    visit '/logout'
    page.should have_content "Welcome back, Vlod"
    page.should have_content "Login"

    visit '/signup'
    page.should have_content "We've noticed you've previously signed up, would you rather login instead?"
  end
end


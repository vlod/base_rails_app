require 'spec_helper'

describe User do
  it "should save correctly" do
    user = User.create name:"vlod", email:"vlod@foo.com", password:"foo123", password_confirmation:"foo123"
    User.count.should == 1

    user.name.should == "vlod"
    user.email.should == "vlod@foo.com"
    user.signed_up == true
  end

  it "should not save if bad email" do
    user = User.create name:"vlod", password:"foo123", password_confirmation:"foo123"
    user.should_not be_valid

    addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
    addresses.each do |invalid_address|
      user.email = invalid_address
      user.should_not be_valid
    end

    User.count.should == 0
  end
end
require 'spec_helper'

describe "PasswordResets" do
  it "emails user when requesting password reset" do
    user = FactoryGirl.create(:user)
    visit login_path
    click_link "password"
    fill_in "Email", with: user.email
    click_button "Send instructions"
    current_path.should eq(new_user_session_path)
    page.should have_content("receive a password recovery")
    last_email.to.should include(user.email)
  end
end

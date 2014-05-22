require 'spec_helper'
describe "Require Logins" do
  it "schedule redirects to login" do
    visit schedule_path
    current_path.should eq("/")
  end
  it "add new task redirects to login" do
    visit new_task_path
    current_path.should eq("/")
  end
end
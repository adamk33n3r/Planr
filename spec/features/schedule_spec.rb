require 'spec_helper'
describe "Month Cycles" do
  before do
    login FactoryGirl.create(:user)
    visit schedule_path
  end
  it "should be current month" do
    page.should have_content(Date.current.strftime("%B %Y"))
  end
  it "goes to next month" do
    click_link ">>"
    page.should have_content((Date.current + 1.month).strftime("%B %Y"))
  end
  it "goes to previous month" do
    click_link "<<"
    page.should have_content((Date.current - 1.month).strftime("%B %Y"))
  end
end
require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  describe "user validation" do
    it "should have correct information" do
      user.email.should =~ /someone\d*@example.com/
    end
    it "should be valid" do
      user.should be_valid
    end
  end
end
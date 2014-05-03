require 'spec_helper'

describe "Generic Tests" do
  it "should fail" do
    1.should_not eq(2)
  end
  it "should increment by one" do
    value = 10
    value.should eq(10) # This is a necessary pre-condition, not the actual test
    value += 1
    value.should eq(11)
  end
end
require 'spec_helper'

describe Task do
  it "should fail" do
    1.should eq(2)
  end
  it "should increment by one" do
    value = 10
    value.should eq(10) # This is a necessary pre-condition, not the actual test
    value += 1
    value.should eq(11)
  end
end

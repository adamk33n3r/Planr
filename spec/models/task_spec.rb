require 'spec_helper'

describe Task do
  let(:t) { FactoryGirl.create(:task) }
  it "Create generic task" do
    t.name.should eq("Task Name")
    t.due.should eq("1969-1-1 00:00")
    t.level.should eq(1)
    t.should be_valid
  end
end

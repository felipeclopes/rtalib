require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "moving_average" do
  it "returns nil for values shorter than period" do
    result = RTALib.ma([0..2], {:period => 5})
    result.should eq(nil)
  end

  it "the average of the last 'period' items" do
  	result = RTALib.ma([0,2,4,6], {:period => 2})
    
    result[0].should eq({:value => 0, :ma => 0})
    result[1].should eq({:value => 2, :ma => 1})
    result[2].should eq({:value => 4, :ma => 3})
    result[3].should eq({:value => 6, :ma => 5})
  end

  it "set the default period is 5" do
  	values = [0,2,4,6,8]
  	result = RTALib.ma(values)
    
    result[0].should eq({:value => 0, :ma => 0})
    result[4].should eq({:value => 8, :ma => values.inject{|sum, x| sum + x} / 5})
  end
end

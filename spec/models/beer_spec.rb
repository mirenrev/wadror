require 'spec_helper'

describe Beer do
  it "is saved to the database if it has a name and a style" do
    Beer.create name:"Koff", style:"Lager"
    expect(Beer.count).to eq(1)  
  end
  it "is not created without a name" do
    Beer.create style:"Lager"
    expect(Beer.count).to eq(0)
  end
  it "is not created without a style" do
    Beer.create name:"Koff"
    expect(Beer.count).to eq(0)
  end
end

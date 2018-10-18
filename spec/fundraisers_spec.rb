require_relative '../models/fundraiser'

describe Fundraisers do
  it "should be able to add and return all fundraisers" do
    Fundraiser.new
    expect(Fundraisers.instance.all.length).to eq 1
  end
end

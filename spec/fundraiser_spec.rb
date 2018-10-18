require_relative '../models/fundraiser'
require_relative '../models/donor'
require_relative '../models/donation'

describe Fundraiser do
  before(:each) do
    @fundraiser = Fundraiser.new

    @donor1 = Donor.new
    @donor1.id = 1
    @donor1.name = "Generous donor"
    @donor1.donation = Donation.new(100_00)
    @donors = Hash.new

    @donors[@donor1.id] = @donor1
    @fundraiser.donors = @donors
  end

  it "should have a name" do
    name = "Sid's fundraiser"
    @fundraiser.name = name

    expect(@fundraiser.name).to eq name
  end

  it "should have Donors" do
    expect(@fundraiser.donors[1]).not_to be_nil
  end

  it "should have a total amount of money raised" do
    expect(@fundraiser.get_total_raised).to eq "100.00"
  end

  it "should return information about no donors or donations" do
    fundraiser = Fundraiser.new
    expect(fundraiser.get_total_raised).to eq "This fundraiser currently has no donations, be the first!"
  end
end

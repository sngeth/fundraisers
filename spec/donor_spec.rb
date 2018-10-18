require_relative '../models/donor'
require_relative '../models/fundraiser'
require_relative '../service/fundraisers'

describe Donor do
  it "should have a name" do
    expect(Donor.new("Sid").name).to eq "Sid"
  end

  it "should have a list of fundraisers they've donated to" do
    donor = Donor.new("Sid")
    fundraiser1 = Fundraiser.new("Chess Club")
    fundraiser2 = Fundraiser.new("Programming Club")
    Fundraisers.instance.add(Fundraiser.new("Did not donate to this"))

    fundraiser1.donate(donor, 100_00)
    fundraiser2.donate(donor, 100_00)

    expect(donor.fundraisers_donated).to eq "Chess Club, Programming Club"
    expect(donor.fundraisers_donated).not_to include("Did not donate to this")
  end
end

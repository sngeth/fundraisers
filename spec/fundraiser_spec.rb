require_relative '../models/fundraiser'
require_relative '../models/donor'
require_relative '../models/donation'

describe Fundraiser do
  it "should have a name" do
    fundraiser = Fundraiser.new
    name = "Sid's fundraiser"
    fundraiser.name = name

    expect(fundraiser.name).to eq name
  end

  it "can accept donations" do
    fundraiser = Fundraiser.new
    donor = Donor.new("Sid")
    fundraiser.donate(donor, 100_00)

    expect(fundraiser.get_total_raised).to eq "100.00"
  end

  it "should return information about no donors or donations" do
    fundraiser = Fundraiser.new
    expect(fundraiser.get_total_raised).to eq "This fundraiser currently has no donations, be the first!"
  end

  it "should applaud its list of donors" do
    fundraiser = Fundraiser.new
    donor = Donor.new("Sid")
    fundraiser.donate(donor, 100_00)

    donor = Donor.new("Ashley")
    fundraiser.donate(donor, 200_00)

    expected = <<-HEREDOC
      Thank you to our wonderful list of donors:
      Sid, Ashley
    HEREDOC

    expect(fundraiser.list_of_donors).to eq expected
  end

  it "should not create duplicate fundraisers" do
    Fundraiser.new("A fundraiser")
    expect { Fundraiser.new("A fundraiser") }.to raise_error "A fundraiser with that name already exists"
  end
end

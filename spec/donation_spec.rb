require_relative '../models/donation'

describe Donation do
  it "should have a date" do
    donation = Donation.new(100_00)
    expect(donation.date).not_to be_nil
  end

  it "should have an amount" do
    donation = Donation.new(100_00)
    expect(donation.amount.to_s).to eq "100.00"
  end
end

require_relative '../models/fundraiser'

describe Fundraisers do
  it "should be able to add and return all fundraisers" do
    Fundraiser.new
    expect(Fundraisers.instance.all.length).to eq 1
  end

  it "should find a single fundraiser " do
    fundraiser = Fundraiser.new("Find me")
    find_me = Fundraisers.instance.find(fundraiser)

    expect(find_me).to eq fundraiser
  end

  it "should be able to edit an existing fundraiser" do
    fundraiser = Fundraiser.new("Edit me")
    Fundraisers.instance.edit(fundraiser, { name: "New Name" })
    expect(Fundraisers.instance.all.first.name).to eq "New Name"
  end

  it "should be able to delete fundraisers" do
    fundraiser = Fundraiser.new("Delete this")
    expect(Fundraisers.instance.all.length).to eq 1
    Fundraisers.instance.delete(fundraiser)
    expect(Fundraisers.instance.all.length).to eq 0
  end
end

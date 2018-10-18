require_relative './donation'
require_relative '../service/fundraisers'

class Fundraiser
  attr_accessor :id, :name, :donors, :donations

  def initialize(name = "Unknown Fundraiser #{Random.new}")
    @name = name
    @donors = []
    @donations = Money.new(0)
    Fundraisers.instance.add(self)
  end

  def donate(donor, amount)
    donation = Donation.new(amount)
    @donors << donor
    @donations += donation.amount
  end

  def get_total_raised
    return no_donations if donors.empty?
    @donations.to_s
  end

  def no_donations
    "This fundraiser currently has no donations, be the first!"
  end

  def list_of_donors
    donators = donors.map { |d| d.name }.join(", ")

    <<-HEREDOC
      Thank you to our wonderful list of donors:
      #{donators}
    HEREDOC
  end

  def validate
    names = Fundraisers.instance.all.map { |f| f.name }
    raise "A fundraiser with that name already exists" if names.include? name
  end
end

class Fundraiser
  attr_accessor :name, :donors, :donations

  def initialize
    @donations = Money.new(0)
  end

  def get_total_raised
    return no_donations if donors.nil?

    donors.each do |id, donor|
      @donations += donor.donation.amount
    end

    @donations.to_s
  end

  def no_donations
    "This fundraiser currently has no donations, be the first!"
  end
end

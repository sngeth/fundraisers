require_relative './donation'

class Fundraiser
  attr_accessor :name, :donors, :donations

  def initialize
    @donors = []
    @donations = Money.new(0)
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
end

class Donor
  attr_accessor :id, :name, :donations

  def initialize(name)
    @name = name
  end

  def fundraisers_donated
    fundraisers_donated_to = []

    Fundraisers.instance.all.each do |f|
      f.donors.each do |donor|
        if donor.name == @name
          fundraisers_donated_to << f.name
        end
      end
    end

    fundraisers_donated_to.join(", ")
  end
end

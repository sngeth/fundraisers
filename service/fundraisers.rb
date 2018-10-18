require 'singleton'

class Fundraisers
  include Singleton

  def initialize
    @list_fundraisers = []
  end

  def find(fundraiser)
    @list_fundraisers.select { |f| f == fundraiser }.first
  end

  def all
    @list_fundraisers
  end

  def add(fundraiser)
    @list_fundraisers << fundraiser
  end

  def edit(fundraiser, new_attrs)
    existing_fundraiser = find(fundraiser)

    if (!existing_fundraiser.nil?)
      existing_fundraiser.name = new_attrs[:name]
    end
  end

  def delete(fundraiser)
    @list_fundraisers.delete fundraiser
  end

  def clear!
    @list_fundraisers = []
  end
end

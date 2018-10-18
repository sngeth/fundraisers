require 'singleton'

class Fundraisers
  include Singleton

  def initialize
    @list_fundraisers = []
  end

  def all
    @list_fundraisers
  end

  def add(fundraiser)
    @list_fundraisers << fundraiser
  end

  def clear!
    @list_fundraisers = []
  end
end

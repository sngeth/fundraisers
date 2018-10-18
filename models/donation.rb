require 'money'
require 'date'

class Donation
  attr_accessor :amount, :date

  def initialize(amount, currency = :usd)
    @amount = Money.new(amount, currency)
    @date = DateTime.now.strftime("%B %d, %Y")
  end
end

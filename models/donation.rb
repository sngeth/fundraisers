require 'money'

class Donation
  attr_accessor :amount

  def initialize(amount, currency = :usd)
    Money.locale_backend = :i18n
    I18n.enforce_available_locales = false
    @amount = Money.new(amount, currency)
  end
end

module SimpleSaas
  class Subscription < ActiveRecord::Base
    attr_accessible :renew_at, :subscription_type_id, :user_id, :active

    belongs_to :subscription_type
    #belongs_to :currency

    after_create :create_payment

    def create_payment
      @currency = Currency.find_by_short_code("gbp")

      @payment = Payment.create!(
      	:payment_type_id => PaymentType.find_by_name("dr").id,
      	:amount => self.subscription_type.cost,
      	:currency_id => @currency.id,
      	:rebased => self.subscription_type.cost / @currency.exchange_rate,
      	:subscription_id => self.id
      )
    end
  end
end

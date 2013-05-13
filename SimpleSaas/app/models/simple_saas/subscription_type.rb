module SimpleSaas
  class SubscriptionType < ActiveRecord::Base
    attr_accessible :cost, :duration, :name

    has_many :subscriptions

    belongs_to :payment_method
  end
end

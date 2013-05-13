module SimpleSaas
  class PaymentMethod < ActiveRecord::Base
    attr_accessible :name

    has_many :payment_types
  end
end

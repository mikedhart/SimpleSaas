module SimpleSaas
  class PaymentType < ActiveRecord::Base
    attr_accessible :name

    has_many :payments
  end
end

module SimpleSaas
  class Subscription < ActiveRecord::Base
    attr_accessible :renew_at, :subscription_type_id, :user_id

    belongs_to :subscription_type
    belongs_to :payment
  end
end

module SimpleSaas
  class Payment < ActiveRecord::Base
    attr_accessible :amount, :comment, :currency_id, :payment_type_id, :rebased, :transaction_id

    belongs_to :subscription
    belongs_to :currency
    belongs_to :payment_type
  end
end

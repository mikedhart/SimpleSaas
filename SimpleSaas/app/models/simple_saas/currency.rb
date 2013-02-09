module SimpleSaas
  class Currency < ActiveRecord::Base
    attr_accessible :html_symbol, :name, :short_code

    has_many :payments
  end
end

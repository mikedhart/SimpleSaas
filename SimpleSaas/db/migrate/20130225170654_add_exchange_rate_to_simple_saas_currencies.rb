class AddExchangeRateToSimpleSaasCurrencies < ActiveRecord::Migration
  def change
    add_column :simple_saas_currencies, :exchange_rate, :float, :length => "8,2"
  end
end

class CreateSimpleSaasCurrencies < ActiveRecord::Migration
  def change
    create_table :simple_saas_currencies do |t|
      t.string :name
      t.string :html_symbol
      t.string :short_code

      t.timestamps
    end
  end
end

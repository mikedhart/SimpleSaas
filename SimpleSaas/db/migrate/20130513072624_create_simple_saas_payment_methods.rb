class CreateSimpleSaasPaymentMethods < ActiveRecord::Migration
  def change
    create_table :simple_saas_payment_methods do |t|
      t.string :name

      t.timestamps
    end
  end
end

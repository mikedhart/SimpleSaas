class CreateSimpleSaasPaymentTypes < ActiveRecord::Migration
  def change
    create_table :simple_saas_payment_types do |t|
      t.string :name

      t.timestamps
    end
  end
end

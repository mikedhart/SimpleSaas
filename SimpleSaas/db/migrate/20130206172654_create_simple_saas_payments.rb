class CreateSimpleSaasPayments < ActiveRecord::Migration
  def change
    create_table :simple_saas_payments do |t|
      t.string :transaction_id
      t.string :currency_id
      t.integer :payment_type_id
      t.float :amount
      t.float :rebased
      t.text :comment

      t.timestamps
    end
  end
end

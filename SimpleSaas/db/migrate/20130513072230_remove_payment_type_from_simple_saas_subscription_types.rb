class RemovePaymentTypeFromSimpleSaasSubscriptionTypes < ActiveRecord::Migration
  def up
    remove_column :simple_saas_subscription_types, :payment_type_id
  end

  def down
    add_column :simple_saas_subscription_types, :payment_type_id, :string
  end
end

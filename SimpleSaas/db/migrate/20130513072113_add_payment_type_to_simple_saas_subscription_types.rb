class AddPaymentTypeToSimpleSaasSubscriptionTypes < ActiveRecord::Migration
  def change
    add_column :simple_saas_subscription_types, :payment_type_id, :integer
  end
end

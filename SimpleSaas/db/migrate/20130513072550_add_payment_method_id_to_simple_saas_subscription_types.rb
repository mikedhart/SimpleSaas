class AddPaymentMethodIdToSimpleSaasSubscriptionTypes < ActiveRecord::Migration
  def change
    add_column :simple_saas_subscription_types, :payment_method_id, :integer
  end
end

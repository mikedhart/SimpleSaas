class AddSubscriptionIdToSimpleSaasPayments < ActiveRecord::Migration
  def change
    add_column :simple_saas_payments, :subscription_id, :integer
  end
end

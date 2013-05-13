class AddTokensToSubscriptions < ActiveRecord::Migration
  def change
    add_column :simple_saas_subscriptions, :token, :string
    add_column :simple_saas_subscriptions, :payer_id, :string
  end
end

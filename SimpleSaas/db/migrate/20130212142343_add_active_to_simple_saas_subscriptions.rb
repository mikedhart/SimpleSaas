class AddActiveToSimpleSaasSubscriptions < ActiveRecord::Migration
  def change
    add_column :simple_saas_subscriptions, :active, :boolean, :default => true
  end
end

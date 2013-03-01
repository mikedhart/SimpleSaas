class AddDeletedToSimpleSaasSubscriptions < ActiveRecord::Migration
  def change
    add_column :simple_saas_subscriptions, :deleted, :boolean
  end
end

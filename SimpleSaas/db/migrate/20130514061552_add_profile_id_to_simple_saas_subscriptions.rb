class AddProfileIdToSimpleSaasSubscriptions < ActiveRecord::Migration
  def change
    add_column :simple_saas_subscriptions, :profile_id, :string
  end
end

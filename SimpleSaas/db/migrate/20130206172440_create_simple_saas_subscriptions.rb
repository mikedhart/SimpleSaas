class CreateSimpleSaasSubscriptions < ActiveRecord::Migration
  def change
    create_table :simple_saas_subscriptions do |t|
      t.integer :subscription_type_id
      t.integer :user_id
      t.datetime :renew_at

      t.timestamps
    end
  end
end

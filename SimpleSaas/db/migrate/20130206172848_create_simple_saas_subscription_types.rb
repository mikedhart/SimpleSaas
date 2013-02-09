class CreateSimpleSaasSubscriptionTypes < ActiveRecord::Migration
  def change
    create_table :simple_saas_subscription_types do |t|
      t.string :name
      t.integer :duration
      t.float :cost

      t.timestamps
    end
  end
end

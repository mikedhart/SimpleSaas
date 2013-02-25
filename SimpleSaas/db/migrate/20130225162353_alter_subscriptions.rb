class AlterSubscriptions < ActiveRecord::Migration
  def self.up
    change_column :simple_saas_subscriptions, :active, :boolean, :default => false
  end

  def down
  	change_column :simple_saas_subscriptions, :active, :boolean, :default => true
  end
end

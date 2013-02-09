class EditRenewAtColumn < ActiveRecord::Migration
  def up
  	add_column :simple_saas_subscriptions, :renew_on, :date
  end
end

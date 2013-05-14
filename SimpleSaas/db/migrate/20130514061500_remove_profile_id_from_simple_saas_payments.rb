class RemoveProfileIdFromSimpleSaasPayments < ActiveRecord::Migration
  def up
    remove_column :simple_saas_payments, :profile_id
  end

  def down
    add_column :simple_saas_payments, :profile_id, :string
  end
end

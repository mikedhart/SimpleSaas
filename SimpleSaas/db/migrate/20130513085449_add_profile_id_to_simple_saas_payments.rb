class AddProfileIdToSimpleSaasPayments < ActiveRecord::Migration
  def change
    add_column :simple_saas_payments, :profile_id, :string
  end
end

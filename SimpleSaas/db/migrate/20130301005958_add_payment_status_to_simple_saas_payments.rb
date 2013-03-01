class AddPaymentStatusToSimpleSaasPayments < ActiveRecord::Migration
  def change
    add_column :simple_saas_payments, :payment_status, :string
  end
end

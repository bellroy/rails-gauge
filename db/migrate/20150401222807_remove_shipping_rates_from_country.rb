class RemoveShippingRatesFromCountry < ActiveRecord::Migration
  def change
    remove_column :countries, :regular_shipping_rate, :string
    remove_column :countries, :express_shipping_rate, :string
  end
end

class RenameRatesToShippingRates < ActiveRecord::Migration
  def change
    rename_table :rates, :shipping_rates
    rename_column :shipping_rates, :regular_shipping_rate, :regular_rate
    rename_column :shipping_rates, :express_shipping_rate, :express_rate
  end
end

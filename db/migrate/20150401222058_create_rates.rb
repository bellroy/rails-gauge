class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :regular_shipping_rate
      t.string :express_shipping_rate
      t.string :currency_code
      t.references :country, index: true

      t.timestamps
    end
  end
end

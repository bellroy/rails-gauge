class Rate < ActiveRecord::Base
  belongs_to :country

  validates_presence_of :regular_shipping_rate, :express_shipping_rate, :currency_code 
  validates_uniqueness_of :currency_code, :scope => :country
end

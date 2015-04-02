class ShippingRate < ActiveRecord::Base
  
  validates_presence_of :regular_rate, :express_rate, :currency_code 
  validates_uniqueness_of :currency_code, :scope => :country

  belongs_to :country, dependent: :destroy
end

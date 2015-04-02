class Country < ActiveRecord::Base

  validates_presence_of :name , :code
  validates_uniqueness_of :name, :code

  has_many :shipping_rates
end

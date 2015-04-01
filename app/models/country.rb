class Country < ActiveRecord::Base

  has_many :rates

  validates_presence_of :name , :code
  validates_uniqueness_of :name, :code
end

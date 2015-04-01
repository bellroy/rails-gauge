FactoryGirl.define do

  factory :rate do
    currency_code  { ["AUD", "GBP", "EUR", "USD"].sample }
    regular_shipping_rate { (rand(100) + 10).to_s }
    express_shipping_rate { (rand(100) + 10).to_s }
  end

end

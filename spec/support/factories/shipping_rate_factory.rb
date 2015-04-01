FactoryGirl.define do

  factory :shipping_rate do
    currency_code  { ["AUD", "GBP", "EUR", "USD"].sample }
    regular_rate { (rand(100) + 10).to_s }
    express_rate { (rand(100) + 10).to_s }
  end

end

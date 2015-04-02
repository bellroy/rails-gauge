require "rails_helper"

describe ShippingRatesController do
  let(:code)           { "AU" }
  let(:currency_code) {"EUR"}
  let!(:country)       { FactoryGirl.create :country, :code => code }
  let!(:first_rate) { FactoryGirl.create :shipping_rate, :currency_code => "EUR", :country => country }
  let!(:second_rate) { FactoryGirl.create :shipping_rate, :currency_code => "USD", :country => country }

  describe "shipping_rates" do
    subject(:shipping_rates) { get :shipping_rates, :country_code => code, :currency_code => currency_code,  :format => :json }

    it { is_expected.to be_successful }

    describe "response body" do
      subject(:response_body) { shipping_rates; JSON.parse(response.body) }

      specify { expect(response_body["regular"]).to eq first_rate.regular_rate }
      specify { expect(response_body["express"]).to eq first_rate.express_rate }
    end

  end

  describe "all_rates_for_country" do
    subject(:shipping_rates) { get :all_rates_for_country, :country_code => code, :format => :json }

    it { is_expected.to be_successful }

    describe "response body" do
      subject(:response_body) { shipping_rates; JSON.parse(response.body) }

      it "contains all rates" do
         expect(response_body["shipping_rates"].count).to eq 2
      end

      it "returns rates attributes" do
        expect(response_body["shipping_rates"].first["currency_code"]).to eq first_rate.currency_code
        expect(response_body["shipping_rates"].first["regular_rate"]).to eq first_rate.regular_rate
        expect(response_body["shipping_rates"].first["express_rate"]).to eq first_rate.express_rate
      end
    end
  end
end

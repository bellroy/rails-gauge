require "rails_helper"

describe CountriesController do

  describe "shipping_rates" do
    let(:code)           { "AU" }
    let(:currency_code) {"EUR"}
    let!(:country)       { FactoryGirl.create :country, :code => code }
    let!(:rate) { FactoryGirl.create :rate, :currency_code => currency_code, :country => country }
    # before(:each) do
    #   FactoryGirl.create :country, :code => "US"
    #   FactoryGirl.create :rate, :currency_code => "EUR", :country => country 
    # end        

    subject(:shipping_rates) { get :shipping_rates, :country_code => code, :currency_code => currency_code,  :format => :json }

    it { is_expected.to be_successful }

    describe "response body" do
      subject(:response_body) { shipping_rates; JSON.parse(response.body) }

      specify { expect(response_body["regular"]).to eq rate.regular_shipping_rate }
      specify { expect(response_body["express"]).to eq rate.express_shipping_rate }
    end

  end

end

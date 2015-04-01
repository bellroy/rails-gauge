class CountriesController < ApplicationController

  def shipping_rates
    @country = Country.find_by_code(shipping_rates_params[:country_code])
    @rate = Rate.where(:country => @country, :currency_code => shipping_rates_params[:currency_code]).first
    
    respond_to do |format|
      format.json do
        render :json => {
          :regular => @rate.regular_shipping_rate,
          :express => @rate.express_shipping_rate
        }
      end
    end
  end

private

  def shipping_rates_params
    params.permit(:country_code, :currency_code)
  end

end

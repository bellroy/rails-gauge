class ShippingRatesController < ApplicationController

  def shipping_rates
    @country = Country.find_by_code(shipping_rates_params[:country_code])
    @shipping_rate = ShippingRate.where(:country => @country, :currency_code => shipping_rates_params[:currency_code]).first
    
    respond_to do |format|
      format.json do
        render :json => {
          :regular => @shipping_rate.regular_rate,
          :express => @shipping_rate.express_rate
        }
      end
    end
  end

  #ordered by currency_code by default
  def all_rates_for_country
    @country = Country.find_by_code(shipping_rates_params[:country_code])
    @shipping_rates = ShippingRate.where(:country => @country).order(:currency_code)
    
    respond_to do |format|
      format.json do
        render :json => {
          :shipping_rates => @shipping_rates.as_json(:only => [:currency_code, :regular_rate, :express_rate])
        }
      end
    end
  end

private

  def shipping_rates_params
    params.permit(:country_code, :currency_code)
  end

end

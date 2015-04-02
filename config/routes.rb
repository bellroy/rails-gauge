Rails.application.routes.draw do
  
  # support old endpoint
  get 'countries/shipping_rates', to: 'shipping_rates#shipping_rates' 

  resources :shipping_rates, :only => [] do
    get :all_rates_for_country, :on => :collection
    get :shipping_rates, :on => :collection
  end
end

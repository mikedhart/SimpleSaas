SimpleSaas::Engine.routes.draw do
  resources :subscription_types


  resources :currencies


  resources :payment_types


  resources :payments


  resources :subscriptions


  resources :subscriptions do
    resources :payments
  end
  

  root :to => "subscriptions#index"

end

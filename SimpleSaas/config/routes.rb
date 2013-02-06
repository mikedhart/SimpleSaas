SimpleSaas::Engine.routes.draw do
  devise_for :users, :class_name => "SimpleSaas::User"

end

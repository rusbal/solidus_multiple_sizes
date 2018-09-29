Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :sizes
  end
end

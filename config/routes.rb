Rails.application.routes.draw do
  resources :shortened_urls

  root 'shortened_urls#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

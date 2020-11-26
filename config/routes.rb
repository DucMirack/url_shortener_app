Rails.application.routes.draw do
  resources :shortened_url

  root 'shortened_url#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

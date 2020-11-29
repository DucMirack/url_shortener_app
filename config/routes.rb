Rails.application.routes.draw do
  resources :shortened_urls do
    member do
      get :visit_full_url
    end
  end

  root 'shortened_urls#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

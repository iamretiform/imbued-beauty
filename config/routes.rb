Rails.application.routes.draw do
  root 'home#landing_page'

  resources :portfolios
  resources :blogs do
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

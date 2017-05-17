Rails.application.routes.draw do
  resources :portfolios
  resources :blogs do
    resources :posts
  end
  root 'portfolios#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

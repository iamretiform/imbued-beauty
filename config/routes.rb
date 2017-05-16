Rails.application.routes.draw do
  devise_for :clients
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '/api' do
    resources :services
    resources :appointments
    resources :galleries
    resources :photos
  end
end

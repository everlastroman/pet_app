Rails.application.routes.draw do
  root to: 'static_pages#index'
  
  get 'contact', to: 'static_pages#contact'
#skip: :registrations,
  devise_for :admins,  path_name: 'admin', controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }

  namespace :admins do
    get 'dashboard', to: 'home#dashboard'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  namespace :users do
    get 'dashboard', to: 'home#dashboard'
  end
end

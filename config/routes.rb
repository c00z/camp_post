Rails.application.routes.draw do
  root 'welcome#index'


  devise_scope :user do
  get 'login', to: 'devise/sessions#new'
  get 'signup', to: 'devise/registrations#new'
  get 'logout', to: 'devise/sessions#destroy'
  end

  devise_for :users, path_names: {password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
end

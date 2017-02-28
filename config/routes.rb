Rails.application.routes.draw do
  root 'welcome#index'

  # USER ROUTES
  get '/users/:id' => 'users#show', as: 'user'
  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  patch '/users/:id' => 'users#update'
  # Lists ROUTES
  get '/users/:id/list' => 'camping_lists#index', as: 'lists'
  get '/users/:id/list/new' => 'camping_lists#new', as: 'new_list'
  post '/users/:id/list' => 'camping_lists#create', as: 'create_list'


  # CAMPSITE ROUTES
  get '/campsites' => 'campsites#index', as: 'campsites'
  get '/campsites/:id' => 'campsites#show', as: 'campsite'
  get '/campsites/:id/reviews/new' => 'reviews#new', as: 'new_review'
  post '/campsites/:id/reviews' => 'reviews#create', as: 'create_review'
  post '/campsites/:campsite_id/users' =>  'campsites_users#build', as: 'campsite_users'

  # REVIEWS ROUTES
  get '/reviews' => 'reviews#index', as: 'reviews'
  get '/reviews/:id' => 'reviews#show', as: 'review'
  get '/reviews/:id/edit' => 'reviews#edit', as: 'edit_review'
  patch '/reviews/:id' => 'reviews#update'
  delete '/reviews/:id' => 'reviews#destroy'

  devise_scope :user do
  get 'login', to: 'devise/sessions#new'
  get 'signup', to: 'devise/registrations#new'
  get 'logout', to: 'devise/sessions#destroy'
    end

  devise_for :users, path_names: {password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
end

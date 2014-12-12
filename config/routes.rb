Rails.application.routes.draw do
  root             'static_pages#home'

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  get    'ranking' => 'ranking#index'

  post   'login'   => 'sessions#create'
  
  delete 'logout'  => 'sessions#destroy'

  resources :users

  resources :tasks do
  	resources :replies
  end
end
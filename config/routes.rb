Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#home'
  get  'about', to: 'users#about'
  get  'signup', to: 'users#new', as: "signup"
  post 'signup', to: 'users#create', as: "create_user"
  get  'users/:id', to: 'users#show', as: "user"
  get  'users/:id/edit', to: 'users#edit', as: "edit_user"
  get  'users/:id/words', to: 'users#words', as: "user_words"
  patch  'users/:id', to: 'users#update', as: "update_user"
  delete 'users/:id', to: 'users#destroy', as: "delete_user"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'publishers', to: 'publishers#index'
  get 'publishers/:sources', to: 'publishers#show', as: "show_publisher"

  resources :user_articles, only: [:show, :new, :create, :edit, :update, :destroy]

  post 'user_articles/:id', to: 'vocabs#create', as: 'create_vocab'
  delete 'user_articles', to: 'vocabs#destroy', as: 'destroy_vocab'
end

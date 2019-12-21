Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#home'
  get  'signup' => 'users#new',as:"signup"
  post 'signup' => 'users#create',as:"create_user"
  get  'users/:id' => 'users#show',as:"user"
  get  'users/:id/edit' => 'users#edit',as:"edit_user"
  get  'users/:id/words' => 'users#words',as:"user_words"
  patch  'users/:id' => 'users#update',as:"update_user"
  delete 'users/:id',  to: 'users#destroy',as:"delete_user"
  get   'login',   to: 'sessions#new'
  post   'login',   to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
  get   'publishers',   to: 'publishers#index'
  get   'publishers/:sources',   to: 'publishers#show', as:"show_publisher"
  resources :user_articles
  post 'user_articles/:id', to: 'vocabs#create',as: 'create_vocab'
  delete 'user_articles', to: 'vocabs#destroy',as: 'destroy_vocab'

end

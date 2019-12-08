Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ##users
  get  'signup' => 'users#new',as:"signup"
  post 'signup' => 'users#create',as:"create_user"
  get  'users/:id' => 'users#show',as:"user"
  get  'users/:id/edit' => 'users#edit',as:"edit_user"
  patch  'users/:id' => 'users#update',as:"update_user"
  delete 'users/:id',  to: 'users#destroy',as:"delete_user"
  ##session
  get   'login',   to: 'sessions#new'
  post   'login',   to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'


end

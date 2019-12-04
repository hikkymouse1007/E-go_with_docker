Rails.application.routes.draw do
  root 'users#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ##users
  get  'signup' => 'users#new'
  post 'signup' => 'users#create',as:"users_create"
  get  'users/:id' => 'users#show',as:"user"


end

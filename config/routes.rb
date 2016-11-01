Rails.application.routes.draw do

root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users' => 'users#index'
  get 'users/new' => 'users#new', as: :new_user
  post 'users/' => 'users#create'
  get 'users/:id' => 'users#show', as: :user
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'directory' => 'directory#index'

  resources :projects do
      resources :comments
  end

end

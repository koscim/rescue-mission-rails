Rails.application.routes.draw do
  resources :questions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :answers, only: [:create]
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

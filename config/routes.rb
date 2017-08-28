Rails.application.routes.draw do
  resources :questions, only: [:index, :show, :new, :create, :edit, :update]
  resources :answers, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

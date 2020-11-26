Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :clubs do
    resources :club_memberships, only: [ :new, :create, :edit, :update ]
  end

  resources :books, only: [:index, :show]
end

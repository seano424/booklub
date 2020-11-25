Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :room_messages
  resources :rooms

  resources :clubs do
    resources :club_memberships, only: [ :new, :create, :edit, :update ]
  end
end

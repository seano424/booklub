Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :clubs do
    resources :club_memberships, only: [ :new, :create, :edit, :update ]
    resources :rooms do
      resources :room_messages
    end
    resources :club_books, only: [ :new, :create, :edit, :update ]
  end

  resources :books, only: [:index, :show]
  resources :club_memberships, only: :destroy
  resources :club_books, only: :destroy
end

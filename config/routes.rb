Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :clubs do
    resources :club_memberships, only: [ :new, :create, :edit, :update ]
    resources :rooms do
      resources :room_messages
    end
  end

  resources :books, only: [ :index, :show, :new, :create ] do
    collection do
      get "external"
    end
    resources :club_books, only: [ :new, :create, :edit, :update ]
  end
  resources :club_memberships, only: :destroy
  resources :club_books, only: :destroy
  resources :users, only: :show
end

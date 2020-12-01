Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :clubs do
    resources :club_memberships, only: [ :new, :create, :edit, :update ]
    resources :rooms do
      resources :room_messages
    end
    resources :invites, only: [ :new, :create ]
  end

  resources :books, only: [ :index, :show, :new, :create ] do
    collection do
      get "external"
    end
    resources :club_books, only: [ :new, :create, :edit, :update ]
  end
  resources :club_memberships, only: :destroy
  resources :club_books, only: :destroy
end

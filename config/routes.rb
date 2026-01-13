Rails.application.routes.draw do
  root "pages#home"
  resource :session
  resources :passwords, param: :token
  
  resources :trails do
    resources :playlists, only: [:new, :create, :destroy]
  end
end
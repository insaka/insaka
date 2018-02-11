Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :donations
  post "/hook" => "donations#hook"
  post "/donations/:id" => "donations#show"

end

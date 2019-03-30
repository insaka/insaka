Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :donations
  post "/hook" => "donations#hook"
  post "/donations/:id" => "donations#show"
  get "/girls" => "girls#index"
  get "/girls/:id" => "girls#show"
  get "/girls/:id/edit" => "girls#edit"
  post "/girls/:id/edit" => "girls#update"
  delete "/girls/:id" => "girls#destroy"
end

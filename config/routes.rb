Rails.application.routes.draw do
  get '/pages/about' => 'pages#about'
  get 'pages/application' => 'pages#application'
  get '/pages/candidates' => 'pages#candidates'
  get '/pages/more' => 'pages#more'
  get '/pages/contact' => 'pages#contact'
  get '/pages/record' => 'pages#record'
  get '/pages/transparency' => 'pages#transparency'
end

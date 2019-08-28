Rails.application.routes.draw do
  get '/' => 'pages#home'
  get '/pages/about' => 'pages#about'
  get '/pages/about/history' => 'pages#history'
  get '/pages/about/people' => 'pages#people'
  get '/pages/about/thanks' => 'pages#thanks'
  get '/pages/why-insaka' => 'pages#whyInsaka'
  get '/pages/why-insaka/transparency' => 'pages#transparency'
  get '/pages/why-insaka/why-female-ed' => 'pages#femaleEd'
  get '/pages/ways-to-help' => 'pages#waysToHelp'
  get '/pages/ways-to-help/donate' => 'pages#donate'
  get '/pages/for-applicants' => 'pages#forApplicants'
  get '/pages/contact' => 'pages#contact'
end

Rails.application.routes.draw do

  resources :stamps
  get '/stamps/:id/set' => 'stamps#set', as: 'set'
  get 'search', to: 'search#search'
  root 'search#search'

end

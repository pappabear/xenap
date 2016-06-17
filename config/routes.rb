Rails.application.routes.draw do

  resources :stamps
  get '/stamps/:id/set' => 'stamps#set', as: 'set'
  root 'stamps#index'

end

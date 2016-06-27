Rails.application.routes.draw do

  resources :stamps do
    collection { get :search }
  end

  get '/stamps/:id/set' => 'stamps#set', as: 'set'

  root 'stamps#index'

end

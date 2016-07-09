Rails.application.routes.draw do

  resources :stamps do
    collection { get :search }
  end

  get '/stamps/:id/set' => 'stamps#set', as: 'set'

  root 'stamps#index'

  #api
  namespace :api do
    namespace :v1 do
      resources :stamps, only: [:index, :show]
    end
  end

end

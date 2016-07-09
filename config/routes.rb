Rails.application.routes.draw do

  resources :stamps do
    collection { get :search }
  end

  get '/stamps/:id/set' => 'stamps#set', as: 'set'

  root 'stamps#index'

  #api
  namespace :api do
    namespace :v1 do
      #resources :stamps, only: [:index, :show]
      resources :stamps do
        collection { get :search }
      end
    end
  end
  get '/api/v1/stamps/:id/set' => 'api/v1/stamps#set', as: 'set_api'


end

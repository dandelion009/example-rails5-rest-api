Rails.application.routes.draw do

  post :user_token, to: 'user_token#create'

  resources :consumers do
    get :brand_affinities, to: 'consumers#brand_affinities'
  end

  resources :brands do
    get :followers, to: 'brands#followers'
  end

  resources :hooks

end

# == Route Map
#
#                    Prefix Verb   URI Pattern                                        Controller#Action
#                user_token POST   /user_token(.:format)                              user_token#create
# consumer_brand_affinities GET    /consumers/:consumer_id/brand_affinities(.:format) consumers#brand_affinities
#                 consumers GET    /consumers(.:format)                               consumers#index
#                           POST   /consumers(.:format)                               consumers#create
#                  consumer GET    /consumers/:id(.:format)                           consumers#show
#                           PATCH  /consumers/:id(.:format)                           consumers#update
#                           PUT    /consumers/:id(.:format)                           consumers#update
#                           DELETE /consumers/:id(.:format)                           consumers#destroy
#           brand_followers GET    /brands/:brand_id/followers(.:format)              brands#followers
#                    brands GET    /brands(.:format)                                  brands#index
#                           POST   /brands(.:format)                                  brands#create
#                     brand GET    /brands/:id(.:format)                              brands#show
#                           PATCH  /brands/:id(.:format)                              brands#update
#                           PUT    /brands/:id(.:format)                              brands#update
#                           DELETE /brands/:id(.:format)                              brands#destroy
#                     hooks GET    /hooks(.:format)                                   hooks#index
#                           POST   /hooks(.:format)                                   hooks#create
#                      hook GET    /hooks/:id(.:format)                               hooks#show
#                           PATCH  /hooks/:id(.:format)                               hooks#update
#                           PUT    /hooks/:id(.:format)                               hooks#update
#                           DELETE /hooks/:id(.:format)                               hooks#destroy
#

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

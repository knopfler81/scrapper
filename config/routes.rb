Rails.application.routes.draw do


 devise_for :users,
  controllers: {  registrations: "registrations"}


  resources :wanted_concerts

  resources :concerts
  root 'concerts#index'
end

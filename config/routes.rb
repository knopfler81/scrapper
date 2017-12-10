Rails.application.routes.draw do


 devise_for :users,
  controllers: {  registrations: "registrations"}


  resources :concerts
  root 'concerts#index'
end

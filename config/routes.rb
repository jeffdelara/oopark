Rails.application.routes.draw do
  root 'parking_slots#index'

  resources :parking_slots
  resources :entry_points

  resources :cars

end

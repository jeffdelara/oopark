Rails.application.routes.draw do
  get 'histories/show'
  root 'parking_slots#index'

  resources :parking_slots
  resources :entry_points

  resources :cars
  delete 'unpark', to: 'cars#destroy'
  get 'summary/:history_id', to: 'histories#show', as: 'summary'

end

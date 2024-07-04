Rails.application.routes.draw do
  resources :courses
  resource :registration, only: %i[new create]
  resource :session, only: %i[new create destroy]
  resources :payments, only: :new
  resource :fulfillment, only: :show

  root "courses#index"
end

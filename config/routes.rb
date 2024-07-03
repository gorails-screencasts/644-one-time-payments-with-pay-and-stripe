Rails.application.routes.draw do
  resources :courses
  resource :registration, only: %i[new create]
  resource :session, only: %i[new create destroy]

  root "courses#index"
end

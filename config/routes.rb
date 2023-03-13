Rails.application.routes.draw do
  resources :contacts

  namespace :contacts, as: :contact do
    resources :imports, only: %i[ new create show ]
  end

  # Defines the root path route ("/")
  root "contacts#index"
end

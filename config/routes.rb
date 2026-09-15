Rails.application.routes.draw do
  # for resourceful routes
  resources :books do
    member do
      get :delete
    end
  end

  root "books#index"
end

Rails.application.routes.draw do

  root "main#index"

  match 'about', to: "main#about", via: :get
  match 'hello', to: "main#hello", via: :get

  get 'main/index'
  get 'tasks/index'
  get 'tasks/new'
  get 'tasks/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

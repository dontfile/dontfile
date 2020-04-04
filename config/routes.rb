Rails.application.routes.draw do
  root "pages#index"
  # resources :pages

  get "/:url", to: "pages#show", as: :page
  patch "/:url", to: "pages#update"
  delete :delete_file, to: "pages#delete_file", as: :delete_file

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

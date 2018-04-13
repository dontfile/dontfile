Rails.application.routes.draw do
  # resources :pages

  get '/:url', to: 'pages#find', as: :page
  patch '/:url', to: 'pages#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

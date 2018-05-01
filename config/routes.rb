Rails.application.routes.draw do
  
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  # resources :pages

  get '/:url', to: 'pages#find', as: :page
  patch '/:url', to: 'pages#update'
  post :delete_file, to: 'pages#delete_file'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

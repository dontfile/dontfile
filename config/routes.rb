# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'

  get '/:url', to: 'pages#show', as: :page
  patch '/:url', to: 'pages#update'
  delete :delete_file, to: 'pages#delete_file', as: :delete_file

  scope module: :page do
    get ':url/file', to: 'files#show', as: :page_file
    post ':url/file', to: 'files#create', as: :create_page_file
    patch ':url/file', to: 'files#edit', as: :edit_page_file
    delete ':url/file', to: 'files#delete', as: :delete_page_file
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

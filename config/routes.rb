Rails.application.routes.draw do
  root "pages#index"

  get "/:url", to: "pages#show", as: :page
  patch "/:url", to: "pages#update"

  patch "/:url/file", to: "files#update", as: :page_file
  delete "/:url/file", to: "files#destroy"
end

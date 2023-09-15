Rails.application.routes.draw do

  get 'masters/top'
  root to:'masters#top'

resources :books

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

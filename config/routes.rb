Rails.application.routes.draw do
  get 'articles/new'
  get 'welcome/index'
  root 'welcome#index'

  resources :articles
end

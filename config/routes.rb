Rails.application.routes.draw do
  resources :welcome
  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end

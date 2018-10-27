Rails.application.routes.draw do
  root 'top#index'
  resources :urls
  resources :urls do
    resources :questions do
      get 'increment_yes'
      get 'increment_no'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

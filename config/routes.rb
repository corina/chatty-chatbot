Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'


  resources :messages do
    resources :responses
  end

  root to: "home#index"
  
end

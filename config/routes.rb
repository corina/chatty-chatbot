Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'

# scope 'api', as: 'api' do
namespace :api do
  resources :messages do
    resources :responses
  end
end


resources :messages do
  resources :responses
end

  root to: "home#index"

end

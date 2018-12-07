Rails.application.routes.draw do
  root 'topics#index'
  get 'topics/new'

  devise_for :users
  resources :topics do
    resources :maps
  end

  post 'topics/purchase' => 'topics#purchase'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

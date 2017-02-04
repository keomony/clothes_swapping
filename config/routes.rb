Rails.application.routes.draw do
  devise_for :users
  resources :items
  root "items#index"

  get 'users/:id' => 'users#show', as: 'user_show'
  get 'users/:id/wardrobe' => 'users#wardrobe', as: 'user_wardrobe'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

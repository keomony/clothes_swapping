Rails.application.routes.draw do
  devise_for :users

  resources :items do
    resources :requesters
  end


  root "items#index"

  get 'users/:id' => 'users#show', as: 'user_profile'
  get 'users/:id/profile/wardrobe' => 'users#wardrobe', as: 'wardrobe'
  get 'users/:id/profile/requests' => 'requesters#index', as: 'requests'
  get 'users/:id/profile/selectors' => 'selector#index', as: 'second_choice'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

 Rails.application.routes.draw do
  devise_for :users

  resources :items do
    resources :requesters
  end

  resources :swaps


  root "items#index"

  get 'users/:id' => 'users#show', as: 'user_profile'
  get 'users/:id/profile/wardrobe' => 'users#wardrobe', as: 'wardrobe'
  get 'users/:id/profile/requests' => 'requesters#index', as: 'requests'
  get 'users/:id/profile/swaps' => 'swaps#index', as: 'users_swaps_page'
  get 'users/:id/profile/selectors' => 'selectors#index', as: 'second_choice'
  get 'users/:id/profile/selectors/confirm' => 'selectors#create', as: 'request_back'
  get 'users/:id/profile/selectors/complete' => 'selectors#show', as: 'complete_swaps'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

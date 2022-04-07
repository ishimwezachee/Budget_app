Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/new'
  devise_for :users
  unauthenticated :user do
    root to: "users#index"
  end

  authenticated :user do
    root to: "categories#index", as: :authenticated_root
  end
  resources :categories do
    resources :fundings
  end

  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  
end

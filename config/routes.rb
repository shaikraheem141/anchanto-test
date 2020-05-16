Rails.application.routes.draw do
  resources :questions
  resources :answers
  resources :ixams do
    member do
      get :add_questions
      post :add_questions
    end
  end

  root "ixams#index"

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  get 'journey_habits/create'
  get 'responses/create'
  get 'moods/checkin'
  get 'moods/checkin2'
  get 'lessons/show'

  get 'activities/show'
  get 'videos/show'
  get 'lessons/show'
  get 'lessons/:id/videos/:id/rewards', to: 'videos#rewards'
  get 'habits/:id//rewards', to: 'habits#rewards'
  get 'journeys/show'
  get 'users/home'
  get 'users/show'
  get 'users/social'
  get 'users/tools'
  get 'users/support'
  get 'users/teacherhome'
  get 'checkin', to: 'pages#checkin'
  get 'checkin2', to: 'pages#checkin2'

devise_scope :user do
  authenticated :user do
    root 'users#home', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end


  devise_for :users
  get 'users', to: "users#home"
  get 'users/social', to: 'users#social'
  get 'users/tools', to: 'users#tools'
  get 'users/support', to: 'users#support'

  resources :journeys, only: [:show]
  resources :tools, only: [:show]
  resources :habits, only: [:show, :create]
  resources :lessons, only: [:show] do
    resources :activities, only: [:show]
    resources :videos, only: [:show]
  end

  resources :questions, only: [] do
    resources :responses, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

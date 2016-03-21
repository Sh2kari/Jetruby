Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :courses, only: :index do
    resources :participants, only: :index
    resource  :subscriptions, only: [:create, :destroy], controller: :course_subscriptions
    resources :lessons, only: [:index, :show] do
      resources :homeworks, only: [:index, :new, :create]
    end
  end

  namespace :users do
    resource  :profile, only: [:edit, :update], controller: :profile
    resources :subscription_courses, only: :index
    resources :courses do
      resource  :dismiss, only: :create, controller: :course_dismiss
      resources :lessons
    end
  end
end


Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :courses, only: :index do
    resources :participants, only: :index
    resource  :subscriptions, only: [:update, :destroy], controller: :course_subscriptions do
      patch :dismiss, on: :member
    end
    resources :lessons
  end

  namespace :users do
    resource  :profile, only: [:edit, :update], controller: :profile
    resources :courses do
      resources :lessons do
        resources :homeworks
      end
    end
  end
end

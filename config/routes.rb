Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :courses, only: :index do
    resources :participants, only: :index
    resource  :subscriptions, only: [:create, :destroy], controller: :course_subscriptions
    resource :dismiss, only: [:create], controller: :course_dismiss
    resources :lessons
  end

  namespace :users do
    resource  :profile, only: [:edit, :update], controller: :profile
    resources :courses do
      resources :lessons do
        resources :homeworks
      end
    end
    post '/:id/courses/:course_id/ban', to: 'course_dismiss#create', as: :create_course_ban
  end
end

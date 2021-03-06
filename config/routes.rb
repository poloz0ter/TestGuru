# frozen_string_literal: true

Rails.application.routes.draw do

  get 'bages/index'
  root 'tests#index'
  get 'mails/feedback'
  post 'mails/sent'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    get 'gists/index'

    resources :bages, shallow: true
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end

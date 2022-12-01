# frozen_string_literal: true

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'pages#home'

  devise_for :users, controllers: { passwords: 'passwords' }

  resources :users

  resources :auditions

  resources :checkout, only: [:create]

  resources :albums do
    resources :tracks
  end
end

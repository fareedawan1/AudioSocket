# frozen_string_literal: true

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'auditions#new'

  devise_for :users

  resources :auditions do
    member do
      get 'profile_update'
    end
  end

  resources :checkout, only: [:create]

  resources :albums do
    resources :tracks
  end
end

Rails.application.routes.draw do

  resources :listings
  resources :user_projects
  resources :tenants do
    resources :projects do
      get 'users', on: :member
      put 'add_user', on: :member
      get 'listings/send_email' => 'listings#send_email'
    end
  end

  resources :members
  get 'home/index'

   root :to => "home#index"

    
  # *MUST* come *BEFORE* devise's definitions (below)
  as :user do   
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  devise_for :users, :controllers => { 
    :registrations => "registrations",
    :confirmations => "confirmations",
    :sessions => "milia/sessions", 
    :passwords => "milia/passwords", 
  }


end

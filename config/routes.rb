Rails.application.routes.draw do
  post 'friendships/create'

  post 'friendships/destroy'

  # get 'users/index'

  # get 'users/show'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :jobs do
  	resources :resumes
  end

  namespace :admin do
    
  	resources :jobs do
  		member do
  			post :hide
  			post :publish
  		end
  	end

    resources :users do
      member do
        post :to_admin
        post :to_user
      end
    end
    
  end

  resources :users

  # resources :users do
  #   member do
  #     post :add_friend
  #   end
  # end

  root "jobs#index"
end

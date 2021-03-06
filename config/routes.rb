Rails.application.routes.draw do
  
  resources :brands
  resources :employees do
    collection do
      post :import
      get :import
    end
  end

  resources :products do
  	collection do
      post :import
      get :import
    end
	end
  
  devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: 'welcome#index'
end

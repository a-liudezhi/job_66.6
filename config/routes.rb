Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :jobs do
      collection do
       get :search
       get :helper
      end
      member do
        post :publish
        post :hide
      end
        resources :resumes
    end
  end

  resources :jobs do
   collection do
    get :search
    get :helper
    get :about
   end
   member do
     post :publish
     post :hide
     post :join
     post :quit
   end
    resources :resumes
  end

  root 'welcome#index'

end

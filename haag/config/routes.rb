# The priority is based upon order of creation:
# first created -> highest priority.
Haag::Application.routes.draw do
  resources :messages do
    member do
      post :dismiss
      post :add_or_dismiss
    end
  end

  resources :tasks
  match '/tasks/:id/complete' => 'tasks#complete'
  match '/tasks/:id/toggle' => 'tasks#toggle'

  resources :assignments_lists do
    
  end

  resources :courses do
    resources :assignments
    collection { post :validate }
  end
  
  resources :assignments do
    collection do
      post :validate
      get :new_batch
      post :create_batch
    end
  end

  resource :dashboard, :only => :show

  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.
  resources :users
  #root :to => "home#index"
  
  resources :users do
    resources :subscriptions, :only => [:new, :create], :controller => 'users/subscriptions'
  end
  match '/users/:user_id/subscriptions/:course_id/destroy' => 'users/subscriptions#destroy'
  
  devise_scope :user do
    root :to => "dashboard#show" 
    get "sign_out", :to => "devise/sessions#destroy"
  end

  root :to => 'devise/sessions#new'

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

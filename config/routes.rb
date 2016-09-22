Rails.application.routes.draw do
  get 'warnings/unathorised_warning'

  get 'static_pages/sample_page'
  get 'static_pages/sample_form'
  get 'home' => 'pre_sign_up#index' , as: :pre_sign_up
  post 'home/home_bill_save' => 'pre_sign_up#index_bill_save' , as: :index_bill_save

  devise_for :users , :controllers => {:registrations => "user_registeration"}
  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'home#index'
   namespace :api do
    namespace :v1 do
      resources :bills, only: [:index, :create, :show, :update, :destroy]
    end
  end

  resources :bills

  post '/bill/bill_roles' => 'bill_roles#create' , as: :bill_role_create
  patch '/bill/bill_roles/:id' => 'bill_roles#update', as: :bill_role_update

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

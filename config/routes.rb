Rails.application.routes.draw do
 
  get 'admin/users', as: :admin_users
  get 'admin/bookings', as: :admin_bookings
  get 'admin/comments', as: :admin_comments
  get 'admin' => "admin#admin", as: :admin_panel
  # hacemos una ruta nueva, con el metodo post, para confirmar el booking
  post '/admin/bookings/:id/confirm' => "admin#confirm", as: :confirm_booking
  post '/admin/bookings/:id/reject' => "admin#reject", as: :reject_booking
  delete '/admin/users/:id/destroy' => 'admin#destroy_user', as: :destroy_user
  delete '/admin/comments/:id/destroy' => 'admin#destroy_comment', as: :destroy_comment


  resources :comments, only: [:index, :create, :destroy]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'high_voltage/pages#show', id: 'home'

  post '/booking/create' => 'booking#create'


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

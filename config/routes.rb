Rails.application.routes.draw do
  root 'home#show'

  resources :businessmen, except: [:new, :create, :destroy]

  resources :investors, except: [:new, :create, :destroy]

  resources :ideas, except: [:index] do
    member do
      put 'like', to: 'ideas#like'
      put 'dislike', to: 'ideas#dislike'
      put 'interesting', to: 'ideas#interesting'
      put 'publish', to: 'ideas#publish'
    end

    collection do
      get 'for_businessman', to: 'ideas#for_businessman'
      get 'published', to: 'ideas#published'
      get 'my', to: 'ideas#my'
    end
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

  mount Commontator::Engine => '/commontator'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

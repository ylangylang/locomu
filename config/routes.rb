LocomuA::Application.routes.draw do
  resources :user_photos

  get "home/index"
  devise_for :user_auths, controllers: {
      registrations: "user_auths/registrations",
      sessions: "user_auths/sessions",
      passwords: "user_auths/passwords"
  }
  resources :users do
    collection do
      get 'edit_profile'
    end
  end

  root "home#index"

  resources :user_photos do
    get 'page/:page', :action => :index, :on => :collection

    member do
      get 'get_image'
      get 'get_thumb'
      get 'get_icon'
      get 'download_image'
      get 'show_partial'
    end

    collection do
    end
  end

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

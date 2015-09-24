Rails.application.routes.draw do
  resources :open_practices
  devise_for :admins, skip: :registrations

  get '/about', to: 'static_pages#about', as: 'about'

  get '/events', to: 'derby_events#index', as: 'event_index'
  get '/events/submit', to: 'derby_events#new', as: 'event_submit'
  post '/events/submit', to: 'derby_events#create'
  patch '/events/submit', to: 'derby_events#update'

  get '/events/thanks', to: 'derby_events#thanks', as: 'event_thanks'

  get '/practices', to: 'open_practices#index', as: 'practice_index'
  get '/practices/submit', to: 'open_practices#new', as: 'practice_submit'
  post '/practices/submit', to: 'open_practices#create'
  patch '/practices/submit', to: 'open_practices#update'

  get '/practices/thanks', to: 'open_practices#thanks', as: 'practice_thanks'

  devise_scope :admin do
    get '/sign_in', to: 'devise/sessions#new', as: 'sign_in'
  end

  resources :derby_events
  resources :open_practices
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'derby_events#index'

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

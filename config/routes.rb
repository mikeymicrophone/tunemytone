ActionController::Routing::Routes.draw do |map|
  map.resources :sounds

  map.resources :participations

  map.resources :recordings, :has_many => [:sounds]

  map.resources :images

  map.resources :venues, :has_many => [:shows]

  map.resources :shows, :has_many => [:sounds, :participations]

  map.resources :excerpts, :has_many => [:sounds]

  map.resources :performances, :has_many => [:excerpts, :sounds, :participations]

  map.resources :albums, :has_many => [:sounds]

  map.resources :bands, :has_many => [:albums, :shows, :sounds, :participations]

  map.resources :artists, :has_many => [:albums, :shows, :sounds, :participations]

  map.resources :songs, :has_many => [:sounds, :excerpts, :performances]

  map.resources :users, :has_many => [:brands, :configurations, :connections, :effects, :elements, :inputs, :instruments, :knobs, :outputs, :settings, :albums, :artists, :bands, :images, :participations, :performances, :recordings, :shows, :songs, :sounds, :venues]

  map.resources :elements

  map.resources :configurations, :has_many => [:sounds, :uses, :elements]

  map.resources :connections, :has_many => [:elements, :configurations]

  map.resources :outputs, :has_many => [:connections, :inputs, :elements]

  map.resources :inputs, :has_many => [:connections, :outputs, :elements]

  map.resources :settings, :has_many => [:elements]

  map.resources :knobs, :has_many => [:settings]

  map.resources :effects, :has_many => [:knobs, :inputs, :outputs]

  map.resources :brands, :has_many => [:instruments, :effects]

  map.resources :instruments, :has_many => [:inputs, :outputs, :knobs, :elements, :configurations]
  
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  map.resource :account, :controller => "users"
  map.login '/login', :controller => "user_sessions", :action => "new"
  map.logout '/logout', :controller => "user_sessions", :action => "destroy"
  map.signup '/signup', :controller => "users", :action => "new"
  

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

ActionController::Routing::Routes.draw do |map|

  # resources
  map.resource :home, :only => :index, :collection => { :editor => :get, :convert => :get, :stylesheet => :get }
  map.resources :apis, :only => [:index, :edit, :update]

  map.resources :user_sessions
  map.resources :users

  # named routes
  map.editor      '/editor',  :controller => 'home', :action => 'editor'
  map.stylesheet  '/stylesheet.:format',  :controller => 'home', :action => 'stylesheet'
  map.convert     '/convert.:format', :controller => 'home', :action => 'convert'

  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"


  # application root
  map.root :controller => 'home', :action => 'index'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

end


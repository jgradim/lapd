ActionController::Routing::Routes.draw do |map|

  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"


  map.resources :user_sessions
  map.resources :users

  # resources
  map.resource :home, :only => :index, :collection => { :editor => :get, :convert => :get }

  # named routes
  map.editor  '/editor',  :controller => 'home', :action => 'editor'
  map.convert '/convert.:format', :controller => 'home', :action => 'convert'

  # application root
  map.root :controller => 'home', :action => 'index'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

end


ActionController::Routing::Routes.draw do |map|
  
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

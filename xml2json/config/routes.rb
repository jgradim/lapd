ActionController::Routing::Routes.draw do |map|
  
  # resources
  map.resource :home, :only => :index, :collection => { :editor => :get, :convert => :get }
  
  # named routes
  map.editor  '/editor',  :controller => 'home', :action => 'editor'
  map.convert '/convert', :controller => 'home', :action => 'convert'

  # application root
  map.root :controller => 'home', :action => 'index'
  
end

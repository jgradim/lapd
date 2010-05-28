ActionController::Routing::Routes.draw do |map|
  
  # resources
  map.resource :home, :only => :index, :collection => { :editor => :get }
  
  # named routes
  map.editor '/editor', :controller => 'home', :action => 'editor'

  # application root
  map.root :controller => 'home', :action => 'index'
  
end

require 'sinatra/flash'
require 'redis-store'
class Admin < Padrino::Application             
  
  ##
  # Intializers
  #     
  
  # Core
  register Padrino::Helpers   
  register Padrino::Rendering   

  # Authorizaition
  register Padrino::Admin::AccessControl 
  Padrino.use Rack::Session::Redis      

  # Resources. JS, CSS handling ext
  register CompassInitializer
  register AssetHatInitializer      
  register Sinatra::Flash        
  
  ##
  # App Settings 
  #   
  
  # Sessions   
  set :session_id, 'dbd_club'  
  set :login_page, "/admin/sessions/new"         
  
  # Enables and Disables of padrino features
  disable :store_location   
  disable :flash    
 
  ## 
  # Access Rules
  #
  
  # Default
  access_control.roles_for :any do |role|
    role.protect "/"
    role.allow "/sessions"
  end

  access_control.roles_for :admin do |role|
    role.project_module :cashes, "/cashes"
    role.project_module :priorities, "/priorities"
    role.project_module :items, "/items"
    role.project_module :accounts, "/accounts" 
  end    
end
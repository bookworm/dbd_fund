require 'sinatra/flash'
require 'redis-store'
class DbdFund < Padrino::Application 
  
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
  set :login_page, "/"    
  set :session_id, 'dbd_club' 
  
  # Enables and Disables of padrino features
  disable :store_location    
  disable :flash    
end
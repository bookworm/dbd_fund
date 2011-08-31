module AMInitializer
  def self.registered(app)
    require 'activemerchant'
    require 'money'  
  end                           
end


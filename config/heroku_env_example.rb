if Padrino.env == :production  
  ENV['DOMAIN'] = 'fund.designbreakdown.'  
else
  ENV['DOMAIN'] = 'localhost:3000' 
end
ENV['ASSET_HOST']       = "http://assets%d-fund.designbreakdown.com"  
ENV['ASSET_HOST_COUNT'] = '4'       

# S3
ENV['S3_ACCESS_KEY']            = 'XXXXXXXXXX'
ENV['S3_SECRET_ACCESS_KEY']     = 'XXXXXXXXXXXXXX' 
ENV['S3_BUCKET']                = 'media-fund.designbreakdown.com'   

# Pass Stuff  
ENV['PASS_SALT_SECRET']         = "XXXXXXXXXXXXX"     

# Paypal
ENV['PAYPAL_RETURN_URL'] = 'http://fund.designbreakdown.com/thankyou' 
ENV['PAYPAL_NOTIFY_URL'] = 'http://XXXXXX'
ENV['PAYPAL_CURRENCY']   = 'USD'   

if defined?(Padrino)
  if !Padrino.env == :production
    ENV['PAYPAL_ACCOUNT']              = 'XXXXXXXX'
    ActiveMerchant::Billing::Base.mode = :test        
    ENV['PAYPAL_CERT_ID']              = 'XXXXXXXXXX'     
    ENV['PAYPAL_URL']                  = 'https://www.sandbox.paypal.com/cgi-bin/webscr'  
  else 
    ENV['PAYPAL_ACCOUNT']              = 'XXXXXXXXXX'
    ActiveMerchant::Billing::Base.mode = :production        
    ENV['PAYPAL_CERT_ID']              = 'XXXXX'     
    ENV['PAYPAL_URL']                  = 'https://www.paypal.com/cgi-bin/webscr'
  end     
  # Paypal certificates   
  if !defined?(PAYPAL_CERT_PEM)
    PAYPAL_CERT_PEM = File.read("#{Padrino.root}/certs/paypal_cert.pem")
    APP_CERT_PEM    = File.read("#{Padrino.root}/certs/app_cert.pem")
    APP_KEY_PEM     = File.read("#{Padrino.root}/certs/app_key.pem")    
  end
end   

# VLAD/Deployment Enviroment Variables
ENV['DEPLOY_USER']      = "XXXXXXXX"
ENV['APP_NAME']         = "dbd_fund" 
ENV['SSH_USER']         = "XXXXXX" 
ENV['DEPLOY_DOMAIN']    = "XXXXXXXX" 
ENV['APP_DOMAIN']       = "XXXXXXXXXm"
ENV['REPOSITORY']       = "ssh://#{ENV['domain']}/home/#{ENV['deploy_user']}/repos/#{ENV['app_name']}.git"
ENV['DEPLOY_TO']        = "/home/#{ENV['deploy_user']}/#{ENV['app_domain_name']}/#{ENV['app_name']}"     
ENV['NGINX_SITE_PATH']  = "/etc/nginx/sites-available/#{ENV['app_domain_name']}"
ENV['DEPLOY_VIA']       = "git"    
ENV['NUM_THIN_SERVERS'] = '2' 
ENV['THIN_PORT']        = '5000'
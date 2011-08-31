# Paypal payment helpers.
DbdFund.helpers do 
 
  def payment_service_for_paypal(donation_num_id, account, options = {})         

    integration_module = ActiveMerchant::Billing::Integrations.const_get(options.delete(:service).to_s.camelize)              
   
    result = []
    result << "<form action=\"#{ENV['PAYPAL_URL']}\" method=\"post\" id=\"paypal_form\" >"
    
    service_class = integration_module.const_get('Helper')    
    service = service_class.new(@donation_num_id, account, options)
    
    values = {        
      :business => ENV['PAYPAL_ACCOUNT'],   
      :cmd => '_donations',           
      :amount => 0.0,
      :currency_code => ENV['PAYPAL_CURRENCY'],
      :return => ENV['PAYPAL_RETURN_URL'],
      :notify_url => ENV['PAYPAL_RETURN_URL'],   
      :invoice => donation_num_id  
    }
        
    values.each do |field, value| 
       result << hidden_field_tag(field, :value => value, :id => "paypal_#{field}")    
    end
    
    result << '</form>'
    result= result.join("\n")
    
    concat_content(result.respond_to?(:html_safe) ? result.html_safe : result)
    nil
  end  
end
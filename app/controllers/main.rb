require 'money' 
include ActiveMerchant::Billing::Integrations     

DbdFund.controllers :main do  
  
  get :index, :map => "/" do       
    prev_donation = Donation.first({:order => "num_id desc"}) 
    if prev_donation == nil
      @donation_num_id = 1
    else 
      @donation_num_id = prev_donation.num_id + 1
    end
    @cash = Cash.first  
    need = Priority.first({:title => 'need'})
    @needs = need.items      
    want = Priority.first({:title => 'want'})
    @wants = want.items      
    
    @donors = Donor.all({:valid_donor => true})
    
    # Chart Linear Calculation  
    @max_chart_size = 250
    @min_chart_size = 120
    @occurs = []      
    @needs.each do |item|     
      @occurs.push(item.price.to_i)
    end     
    @wants.each do |item|     
      @occurs.push(item.price.to_i)
    end
    @max_occurs = @occurs.max_by {|x| x}  
    @min_occurs = @occurs.min_by {|x| x}   
    render "other/home"
  end 
  
  get :thankyou, :map => "/thankyou" do 
    render "other/thanks"
  end   
  
  post :thankyou, :map => "/thankyou" do 
    render "other/thanks"
  end      
  
  post :donate, :map => "/donate" do    
    prev_donation = Donation.first 
    if prev_donation == nil
      donation_num_id = 1
    else 
      donation_num_id = prev_donation.num_id + 1
    end    
    if !params['string']['name'].empty?      
      name = params['string']['name'].split(",").join(" ").split(" ").uniq 
      first_name = name[0] 
      @donor = Donor.first({:first_name => first_name})   
      if @donor == nil    
        @donor = Donor.new(params['string'].merge({:valid_donor => false}))
      end
      @donation = Donation.new({:donor_id => @donor.id, :num_id => donation_num_id, :status => :started, :amount => params['string']['amount']}) 
      @donor.save
    else
      @donation = Donation.new({:donor_id => session.id, :num_id => donation_num_id, :status => :started, :amount => params['string']['amount']})
    end      
    if @donation.save 
      "true"            
    else
      "false"
    end
  end 
  
  post :notify, :map => "/ppnotify" do    
    notify = Paypal::Notification.new(request.env["rack.input"].read) 
    if notify.acknowledge    
      @donation = Donation.first({:num_id => notify.invoice.to_i})         
      if !@donation.empty?
        begin                
          if notify.complete? 
            @donor = @donation.donor
            @donor.valid_donor = true
            @donor.save
            @donation.status = :success
            @donation.save       
            @cash = Cash.first 
            @cash.raised = @cash.raised + @donation.amount.to_i
            @cash.save
          else
            logger.error("Failed to verify Paypal's notification, please investigate")
          end
        rescue => e   
          @donation.status = :failed
          @donation.save   
          logger.error("Failed to verify Paypal's notification, please investigate") 
        end    
      end
    end   
  end
end                                
DbdFund.helpers do   
  
  def build_auth_array(auth)  
    new_auth = {}   
    new_auth['provider']     = auth['provider']
    new_auth['provider_uid'] = auth['uid']    
    new_auth['username']     = auth['user_info']['username']
    new_auth['first_name']   = auth['user_info']['first_name']
    new_auth['last_name']    = auth['user_info']['last_name']
    return new_auth   
  end     
  
  def chart_size()          
    raised_percent = (@item.raised.to_i / @item.price.to_i) * 100
    weight = (@item.price.to_i - @min_occurs) / (@max_occurs - @min_occurs)
    price_height  = @min_chart_size + (@max_chart_size - @min_chart_size) * weight
    raised_height = price_height * raised_percent / 100 + 1     
    @title_margin = price_height - 96 + 1
    
    # Price chart heights
    @p_top_height = 27 
    @p_bottom_height = 48    
    if price_height < 75    
      if price_height - 27 > 0  
        @p_bottom_height = price_height - 27   
        @p_top_height = price_height - @p_bottom_height
      else 
        @p_top_height = 0  
        @p_bottom_height = price_height
      end     
      @p_height = 0  
    else
      @p_height = price_height - 75
    end 
    
    # Raised chart heights
    if raised_height < 27 
      if raised_height - 14 > 0  
        @r_bottom_height = raised_height - 14   
        @r_top_height = raised_height - @r_bottom_height
      else 
        @r_top_height = 0  
        @r_bottom_height = raised_height
      end     
      @r_height = 0
    else 
      @r_height = raised_height - 27
    end   
    @r_margin = price_height - raised_height    
  end
end
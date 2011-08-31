class Numeric 
  
  def truncate_to( decimals=0 )
    factor = 10.0**decimals
    (self*factor).floor / factor  
  end 
end  

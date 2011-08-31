class Donation
  include MongoMapper::Document

  # Keys 
  key :status,   String 
  key :donor_id, String 
  key :amount,   String 
  key :num_id,   Integer
  timestamps!    
  
  # Associations 
  belongs_to :donor, :class_name => "Donor", :foreign_key => "donor_id"        
  
end
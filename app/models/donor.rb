class Donor
  include MongoMapper::Document

  # Keys
  key :first_name,  String
  key :last_name,   String   
  key :show_me,     Boolean   
  key :valid_donor, Boolean
  timestamps!   
  
  # Associations
  many :donations,  :foreign_key => "donor_id"  
    
  # Called Saving Name
  def name=(t) 
    if t.kind_of?(String)
      t = t.split(",").join(" ").split(" ").uniq
    end
    self[:first_name] = t[0]
    self[:last_name]  = t[1]
  end   
  
  # Called When Displaying Name
  def name()  
    return "#{self[:first_name]}, #{self[:last_name]}"
  end
  
end
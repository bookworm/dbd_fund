class Priority
  include MongoMapper::Document

  # Keys
  key :title, String
  timestamps!  
  
  # Associations
  many :items,  :foreign_key => "priority_id"
  
end
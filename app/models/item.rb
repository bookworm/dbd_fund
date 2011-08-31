class Item
  include MongoMapper::Document

  # Keys
  key :raised,      String   
  key :name,        String
  key :desc,        String 
  key :desc_source, String
  key :price,       String
  key :priority_id, ObjectId
  timestamps!   
  
  # Key Settings 
  mount_uploader :image, ImageUploader
   
  # Associations
  belongs_to :priority,  :class_name => "Priority", :foreign_key => "priority_id"    
  
  # Callbacks
  before_save :kramit     
  
  # Markdown 
  def kramit
    self.desc = Kramdown::Document.new(self.desc_source).to_html
  end   
  
end
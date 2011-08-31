class Cash
  include MongoMapper::Document

  # Keys
  key :remaining, Integer
  key :expenses,  Integer
  key :made,      Integer
  key :capital,   Integer
  key :raised,   Integer
  timestamps!   
  
end
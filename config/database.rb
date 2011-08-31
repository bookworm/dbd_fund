MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'dbd_fund_development'
  when :production  then MongoMapper.database = 'dbd_fund_production'
  when :test        then MongoMapper.database = 'dbd_fund_test'
end
def mongo_connect(db_name, coll_name)
  @client = Mongo::Client.new(['127.0.0.1:27017'], database: db_name)
  Mongo::Logger.logger.level = ::Logger::ERROR
  puts "Connected to \'#{coll_name}\'"
  @client[coll_name]
end
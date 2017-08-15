require 'mongo'
require 'rubygems'

@client = Mongo::Client.new(['127.0.0.1:27017'], database: 'user_actions')

docs = [
  { username: 'kbanker' },
  { username: 'pbakkum' },
  { username: 'sverch' }
]

@collection = @client['test_bulk_insert']
@ids        = @collection.insert_many(docs)
puts "Here are the ids from the bulk insert: #{@ids.inspect}"

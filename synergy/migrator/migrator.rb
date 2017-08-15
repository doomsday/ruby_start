require 'mongo'
require 'rubygems'
require './synergy_db_transfer'
require '../connector'

@docs = request_documents

@collection = mongo_connect('synergy', 'payments_asf_data')
@ids        = @collection.insert_many(@docs)
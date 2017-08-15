
require 'rubygems'
require 'mongo'
require '../connector'
require './queries1'

@payments_data = mongo_connect('synergy', 'payments_asf_data')

@result = @payments_data.find(@query4).limit(50).projection('data.$' => 1)

unless @result.to_a.empty?
  @result.each do |row|
    puts row
    puts
  end
  puts "Documents displayed: #{@result.to_a.length}"
end

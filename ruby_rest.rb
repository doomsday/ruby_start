require 'rest_client'
require 'base64'
require 'json'

# http://192.168.1.4:8080/Synergy/rest/api/dictionary/get_by_code?dictionaryCode=month

url = "http://192.168.1.4:8080/Synergy/rest/api/dictionary/get_by_code"
params = {:dictionaryCode => 'month'}

def get (url, params)
  RestClient::Request.execute(
      :method => :get,
      :url => url,
      :headers => {
          :Authorization => 'Basic ' + Base64.encode64('1:1'),
          :params => params
      })
end

def get_dict_values (data)
  result = []

  unless data.empty?
    parsed = JSON.parse(data)
    items = parsed['items']
    items.each do |item|
      values = item['values']
      values.each do |value|
        if value['columnID'] == '487017e3-b4d1-46bd-95fd-e703f490ced5'
          result.push value['value']
        end
      end
    end
  end

  result
end

dictionary = get(url, params)
dict_values = get_dict_values(dictionary)

puts dict_values
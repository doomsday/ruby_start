require 'net/http'
require 'json'

class SimpleHTTP
  def initialize(uri, user = 'nppadmin', pass = '1xb&"Plh~^D?++,QIs2')
    @uri      = URI.parse(uri)
    @username = user
    @password = pass
  end

  def request(path = nil)
    @uri.path         = path if path # use path if provided
    http              = Net::HTTP.new(@uri.host, @uri.port)
    http.read_timeout = 10_000
    req               = Net::HTTP::Get.new(@uri.request_uri)
    req.basic_auth(@username, @password)
    http.request(req)
  rescue Errno::ETIMEDOUT
    return nil
  end
end

def get_docs_json(doc_list = nil, get_data_url)
  result = []
  doc_list.each do |doc_data_ext|
    puts('Requested docbody: ' + doc_data_ext['dataUUID'])
    document_id = doc_data_ext['dataUUID']
    response = SimpleHTTP.new(get_data_url + document_id).request

    next if response.nil?

    parsed_body = JSON.parse(response.body)
    result.push(parsed_body)
    puts('Pushed docbody: ' + result.size.to_s + ' ' + doc_data_ext['dataUUID'])
    puts
  end
  result
end

def request_documents
  get_data_url    = 'http://services.palata.kz/Synergy/rest/api/asforms/data/'
  data_ext_url    = 'http://services.palata.kz/Synergy/rest/api/registry/data_ext?registryID=28c3bd07-6f77-4d9b-9e26-f16e78be5b20&loadData=false'
  found_documents = SimpleHTTP.new(data_ext_url)
  response        = JSON.parse(found_documents.request.body)
  get_docs_json(response['data'], get_data_url)
end

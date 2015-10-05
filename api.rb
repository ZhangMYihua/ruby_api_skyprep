require 'faraday'

API_URL = 'https://api.skyprep.io/admin/api'

conn = Faraday.new(:url => API_URL) do |faraday|
	faraday.request  :url_encoded             
  faraday.response :logger                  
  faraday.adapter  Faraday.default_adapter 
end

response = Faraday.get('#{API_URL}')

class SkyPrepApi

	def initialize(api_key, acct_key)
		@api_key = api_key
		@acct_key = acct_key
	end




end

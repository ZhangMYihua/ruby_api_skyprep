require 'faraday'
require 'json'

API_URL = 'https://api.skyprep.io/admin/api'

response = Faraday.get('#{API_URL}')

class SkyPrepApi

	def initialize(api_key, acct_key)
		@api_key = api_key
		@acct_key = acct_key
		@conn = Faraday.new(:url => API_URL) do |faraday|
			faraday.request  :url_encoded             
		  faraday.response :logger                  
		  faraday.adapter  Faraday.default_adapter 
		end
	end

	def authenticate
	end

	def get_users
		users = @conn.get '/get_users', {"api_key" => @api_key, "acct_key" => @acct_key}
		JSON.parse(users.body)
	end


end

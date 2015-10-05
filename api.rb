require 'faraday'
require 'json'

class SkyPrepApi

	def initialize(api_key, acct_key)
		@api_key = api_key
		@acct_key = acct_key
		@conn = Faraday.new(:url => 'https://api.skyprep.io/admin/api') 
		@hash = {:api_key => @api_key, :acct_key => @acct_key}	
	end

	def test_connection
		response = @conn.get 'test_connection', @hash
		JSON.parse(response.body)
	end

	def get_users
		response = @conn.get 'get_users', @hash
		JSON.parse(response.body)
	end

end

my_app = SkyPrepApi.new('GjNHirhJC0TZ1nmJFtHP0IWfT', 'learnabli.skyprepapp.com')

puts my_app.get_users
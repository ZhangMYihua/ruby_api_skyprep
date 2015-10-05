require 'faraday'
require 'json'

class SkyPrepApi

	def initialize(api_key, acct_key)
		@api_key = api_key
		@acct_key = acct_key
		@conn = Faraday.new(:url => 'https://api.skyprep.io/admin/api')
	end

	def test_connection
		response = @conn.get 'https://api.skyprep.io/admin/api/test_connection', {:api_key => @api_key, :acct_key => @acct_key}
		JSON.parse(response.body)
	end

	def get_users
		response = @conn.get 'https://api.skyprep.io/admin/api/get_users', {:api_key => @api_key, :acct_key => @acct_key}
		JSON.parse(response.body)
	end

end

my_app = SkyPrepApi.new('GjNHirhJC0TZ1nmJFtHP0IWfT', 'learnabli.skyprepapp.com')

puts my_app.get_users
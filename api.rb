require 'faraday'
require 'json'

class SkyPrepApi
	GET_PREFIXES = ['get']
	POST_PREFIXES = ['update', 'destroy', 'create']

	def initialize(api_key, acct_key)
		@api_key = api_key
		@acct_key = acct_key
		@base_url = Faraday.new(:url => 'https://api.skyprep.io/admin/api') 
		@hash = {:api_key => @api_key, :acct_key => @acct_key}	
	end

	def test_connection
		response = @base_url.get 'test_connection', @hash
		JSON.parse(response.body)
	end

	def get(url, hash = {})
		params = @hash.merge(hash)
		response = @base_url.get url, params
		JSON.parse(response.body)
	end

	def post(url, hash = {})
		params = @hash.merge(hash)
		response = @base_url.get url, params
		JSON.parse(response.body)
	end

	def method_missing(method_call, *args)
		string = method_call.to_s
		puts args
		if POST_PREFIXES.any? {|pre| string.include?(pre)}
			self.post(string, args)
		elsif string.include?('get')
			self.get(string, args)
		else
			raise "Issue connecting to API. Please check all parameters"
		end 
	end

end

my_app = SkyPrepApi.new('GjNHirhJC0TZ1nmJFtHP0IWfT', 'learnabli.skyprepapp.com')

puts my_app.create_user({'email' => 'dubbs2@msn.com', 'first_name' => 'Jason'})
require 'faraday'
require 'json'

class SkyPrepApi

	GET_PREFIXES = ['get', 'test_connection']
	POST_PREFIXES = ['update', 'destroy', 'create', 'remove', 'enroll']

	def initialize(api_key, acct_key)
		@api_key  = api_key
		@acct_key = acct_key
		@base_url = Faraday.new(:url => 'https://api.skyprep.io/admin/api') 
		@hash = { :api_key => @api_key, :acct_key => @acct_key }	
	end

	def get(url, hash = {})
		if hash.any?
			params = @hash.merge(hash[0])
		else
			params = @hash
		end
		response = @base_url.get url, params
		JSON.parse(response.body)
	end

	def post(url, hash = {})
		if hash.any?
			params = @hash.merge(hash[0])
		else
			params = @hash
		end
		response = @base_url.get url, params
		JSON.parse(response.body)
	end

	def method_missing(method_call, *args)
		begin
			string = method_call.to_s	
			if POST_PREFIXES.any? {|pre| string.include?(pre)}
				self.post(string, args)
			else
				self.get(string, args)
			end
		rescue Exception => e
			puts e.message 
		end
	end

end



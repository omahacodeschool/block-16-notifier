class Special

	def self.getFacebookInfo
		app_id = ENV["FB_CLIENT_ID"]
		app_secret = ENV["FB_SECRET_ID"]
		specialsInfo = HTTParty.get("https://graph.facebook.com/274838819236148/posts?fields=message,created_time,attachments{media,subattachments}&access_token=#{ENV["FB_CLIENT_ID"]}|#{ENV["FB_SECRET_ID"]}")
		return specialsInfo
	end

	def self.printInfo(info)
		# testInfo = info[0]["data"][0]["message"]
		testInfo = info
		return testInfo["data"][0]["message"]
	end

end
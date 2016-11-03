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

	def self.getTime
		@APIInfo = Special.getFacebookInfo
		time = @APIInfo["data"][0]["created_time"]
		relevant_time = time[11..12]
		relevant_time = relevant_time.to_i
		if !(relevant_time < 14) and !(relevant_time > 16)
			# will need the following data to be added in an entry into the DB
			 @APIInfo["data"][0]["message"]
			 @APIInfo["data"][0]["attachments"]["data"]["media"]["image"]["src"]

		else 
	end
end
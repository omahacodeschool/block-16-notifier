class Facebook
    def self.get_latest_entry
        app_id = ENV["FB_CLIENT_ID"]
        app_secret = ENV["FB_SECRET_ID"]
        @APIInfo = HTTParty.get("https://graph.facebook.com/274838819236148/posts?fields=message,created_time,attachments{media,subattachments}&access_token=#{ENV["FB_CLIENT_ID"]}|#{ENV["FB_SECRET_ID"]}")
            time = @APIInfo["data"][0]["created_time"]
            relevant_time = time[11..12]
            relevant_time = relevant_time.to_i
            if !(relevant_time < 14) and !(relevant_time > 16)
                # will need the following data to be added in an entry into the DB
                 @APIInfo["data"][0]["message"]
                 @APIInfo["data"][0]["attachments"]["data"]["media"]["image"]["src"]
        # Call Facebook, check for a new entry
        # entry = ???

        if !self.is_duplicate?(entry)
            DailySpecial.create(text: entry["foo"], image: entry["bar"])
            # In the database, 'DailySpecial' would have 'sent' be 'false' by default.
        end
    end

    # Return True if the entry is a duplicate.
    def self.is_duplicate?(text)
        # Compare new entry from Facebook to local DB (to avoid duplicates)
    end
end
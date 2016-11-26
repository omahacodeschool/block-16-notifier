class Facebook
    def self.get_latest_entry
        app_id = ENV["FB_CLIENT_ID"]
        app_secret = ENV["FB_SECRET_ID"]

        if ENV["ACCESS_TOKEN"].blank?
            apiInfo = HTTParty.get("https://graph.facebook.com/274838819236148/posts?fields=message,created_time,attachments{media,subattachments}&access_token=#{ENV["FB_CLIENT_ID"]}|#{ENV["FB_SECRET_ID"]}")
        else
            apiInfo = HTTParty.get("https://graph.facebook.com/274838819236148/posts?fields=message,created_time,attachments{media,subattachments}&access_token=#{ENV["ACCESS_TOKEN"]}")
        end
        time = apiInfo["data"][0]["created_time"]
        relevant_time = time[11..12]
        relevant_time = relevant_time.to_i
        if !(relevant_time < 14) and !(relevant_time > 16)
            # will need the following data to be added in an entry into the DB
             message = apiInfo["data"][0]["message"]
             image = apiInfo["data"][0]["attachments"]["data"][0]["media"]["image"]["src"]
             created_at_time = apiInfo["data"][0]["created_time"]
        end

        # Call Facebook, check for a new entry
        # entry = ???

        if !self.is_duplicate?(created_at_time)
            DailySpecial.create(text: message, photo: image, created_time: created_at_time)
            # In the database, 'DailySpecial' would have 'sent' be 'false' by default.
        end

    end

    # Return True if the entry is a duplicate.
    # I think I need help to verify that the boolean will work.

    def self.is_duplicate?(text)
        all_specials = DailySpecial.exists?(created_time: text)
    end
    
end
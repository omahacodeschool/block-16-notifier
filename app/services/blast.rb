class Blast
    def self.create
        # 1. Check database for any DailySpecial records where 'sent' is 'false'.
        # 2. If there is one, `Twilio.send_update_to_subscribers()`.
        # 3. If there is not, do nothing.
    end
end
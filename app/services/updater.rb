class Updater

    # Send the daily special to all of our subscribers.
    #
    # msg - The latest DailySpecial ActiveRecord object.
    def self.send_update_to_subscribers(msg)
        # Send msg to all of our subscribers
        msg.update(sent: true)
    end
end

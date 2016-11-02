Goal:

Get this:

https://graph.facebook.com/274838819236148/posts?fields=message,created_time,attachments{media,subattachments}&access_token=ENV["ACCESS_TOKEN"]

into Ruby land.

---

User visits site.
Simple message saying what the site's for.
Form field for their phone number.
Phone number is added to DB.
Automatic process to check Facebook for new messages between 9:30-11:30am.
If it finds a new result, users will receive text/media of the daily special.
If a user hates this, they can remove themselves.

PAGES

1. Homepage
    - Simple message saying what the site's for.
    - Form field for their phone number.
2. Phone Number Saved

SiteController
    home
        - No data.
        - No service interactions.
    save_phone
        - Phone number is saved to DB
        - None.

BlastsController
    YES:
    - new/create
        + YES: create, POST processes the form
            * Call Facebook, check for a new entry
            * Compare new entry from Facebook to local DB (to avoid duplicates)
            * If new entry, send its details to all of our subscribers and save it to our local DB.
        + NO:new, GET displays the form

    NO:
    - index
    - show
    - edit/update
    - delete


FACEBOOK
* Call Facebook, check for a new entry
* Compare new entry from Facebook to local DB (to avoid duplicates)

TWILIO
* If new entry, send its details to all of our subscribers and save it to our local DB.

---

SiteController
app/controllers/site_controller.rb

```ruby
MyApp.get "/" do
    erb :"/home"
end

MyApp.post "/save_phone" do
    @phone = Phone.create(params[:phone])
    redirect "/"
end
```

Blast
app/services/blast.rb

```ruby
# This class is the bridge between our local DB and the Twilio service.
# It doesn't do much, but it helps us keep things separate in our app.

class Blast
    def self.create
        # 1. Check database for any DailySpecial records where 'sent' is 'false'.
        # 2. If there is one, `Twilio.send_update_to_subscribers()`.
        # 3. If there is not, do nothing.
    end
end
```

Facebook
app/services/facebook.rb

```ruby
class Facebook
    def self.get_latest_entry
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
```

Twilio
app/services/twilio.rb

```ruby
class Twilio

    # Send the daily special to all of our subscribers.
    #
    # msg - The latest DailySpecial ActiveRecord object.
    def self.send_update_to_subscribers(msg)
        # Send msg to all of our subscribers
        msg.update(sent: true)
    end
end
```

---

Add this to main.rb:

```ruby
Dir[File.dirname(__FILE__) + '/app/services/*.rb'].each {|file| require file }
```
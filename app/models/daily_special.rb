class DailySpecial < ActiveRecord::Base

    def self.check_for_false
    	@specials = DailySpecial.all
    	@daily_special = Array.new
    	@specials.each do |check|
    		if check.where(sent: "false")
    			@daily_special << @specials
    		end
    	end
    	return @daily_special 
    end
    
end

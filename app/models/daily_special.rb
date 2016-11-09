class DailySpecial < ActiveRecord::Base

    def self.check_for_false
    	daily_special = Array.new
    	DailySpecial.each do |check|
    		if check.where(sent: "false")
    			daily_special << check
    		end
    	end
    	return daily_special 
    end

end

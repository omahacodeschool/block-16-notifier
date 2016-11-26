class SiteController < ApplicationController
  def home
  	@phone = Phone.new
  end


  def create
  phone = Phone.format_number(phone_params)
  @saved_number = Phone.new(number:phone)


	if @saved_number.save
		flash[:notice] = "Thank you for submitting your phone number.  Look forward to hearing about Block 16's amazing specials."
		redirect_to submitted_path
	else
		flash[:notice] = "Uh oh...something went wrong. Please enter a valid phone number with area code"
		redirect_to root_path
	end
  end

  def send_blast
  	@new_blast = Blast.create
    @blast_info = DailySpecial.last
    render "site/blast"

  end

  def check_facebook_api
  	@check_facebook = Facebook.get_latest_entry
    redirect_to most_recent_special_path
  end

  def most_recent_special
    @todays_special = DailySpecial.where(sent:"false")
    render "site/todaysspecial"
  end

  private

  def phone_params
	params.require(:phone).permit(:number)
  end

end


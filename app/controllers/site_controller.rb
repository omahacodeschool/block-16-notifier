class SiteController < ApplicationController
  def home
  	@phone = Phone.new
  end


  def create
  @phone = Phone.format_number(phone_params)

	if @phone.save
		flash[:notice] = "Thank you for submitting your phone number.  Look forward to hearing about Block 16's amazing specials."
		redirect_to root_path
	else
		flash[:notice] = "Uh oh...something went wrong. Please enter a valid phone number with area code"
		render :new
	end
  end

  def send_blast
  	@new_blast = Blast.create
    @blast_info = DailySpecial.last

  end

  def check_facebook_api
  	@check_facebook = Facebook.get_latest_entry
  end

  private

  def phone_params
	params.require(:phone).permit(:number)
  end

end


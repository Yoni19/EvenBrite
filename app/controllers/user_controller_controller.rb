class UserController < ApplicationController

  before_action :authenticate_user!, only: [:show]

	def show 

		@user = User.find(params[:id])
	
		block_other_users

		# we get event organized by this user
		@user_events = Event.where(organizer_id: @user.id)
	end
	private

	def block_other_users
		if (current_user != @user) && (current_user.is_admin == false)
			flash[:error] = "This is not your profile page"
			redirect_to root_path
		end
	end
end



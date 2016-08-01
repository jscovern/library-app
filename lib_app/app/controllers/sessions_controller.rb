class SessionsController < ApplicationController

	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.confirm(user_params)
		if @user
			login(@user)
			redirect_to "/users/#{@user.id}"
		else
			# flash[:error] = @user.errors.full_messages.join(" ")
			redirect_to '/sign_in'
		end
	end

	def destroy
		logout
		redirect_to users_path
	end

	private
		def user_params
			params.require(:user).permit(:email, :password)
		end
end

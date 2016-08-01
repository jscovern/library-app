class LibraryUsersController < ApplicationController
	before_action :logged_in?
	
	def index
		@user = User.find(params[:user_id])
		@libraries = @user.libraries
		current_user #sets the @current_user

		render :index
	end

	def create
		@user = current_user
		@library = Library.find(params[:library_id])
		@user.libraries.push(@library)

		redirect_to user_libraries_path(@user)
	end
end

class LibrariesController < ApplicationController
	before_action :logged_in?, except: [:index], only: [:new, :create]

	def index
		@libraries = Library.all
		render :index
	end

	def new
		@library = Library.new
		render :new
	end

	def create
		@library = Library.create(library_params)
		redirect_to "/libraries/#{@library.id}"
	end

	def edit
		@library = Library.find_by_id(params[:id])
		render :edit
	end

	def update
		@library = Library.find_by_id(params[:id])
		@library.update_attributes(library_params)
		redirect_to "/libraries/#{@library.id}"
	end

	def show
		@library = Library.find_by_id(params[:id])
		render :show
	end

	def destroy
		@library = Library.find_by_id(params[:id])
		@library.destroy
		redirect_to "/libraries"
	end

	private
		def library_params
			params.require(:library).permit(:name, :floor_count, :floor_area)
		end
end

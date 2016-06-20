class UsersController < ApplicationController

	def index
		@users = User.all
		render :index
	end

	def newxs
		#make a new user to pass to the form later
		@user = User.new
		render :new
	end

	def create
		user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
		@user = User.create(user_params)

		redirect_to "/users/#{@user.id}"
	end

	def show
		@user = User.find(params[:id])
		render :show
	end

#after a user signs up they should be logged in
	def create
		user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
		@user = User.create(user_params)
		login(@user) #log in user
		redirect_to "/users/#{@user.id}" #go to show
	end

end

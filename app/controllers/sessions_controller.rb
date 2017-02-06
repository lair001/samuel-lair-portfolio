class SessionsController < JsonController

	def new

	end

	def create
		@user = User.find_by(username: params[:username].strip)
		if @user && !@user.banned? && @user.authenticate(params[:password].strip)
			sign_in_user
			@user.administrator? ? redirect_to(sidekiq_web_path) : redirect_to(root_path)
		else
			flash[:error] = "Your credentials are invalid."
			render :new
		end
	end

	def destroy
		@user = current_user
		sign_out_user
		redirect_to root_path
	end

end
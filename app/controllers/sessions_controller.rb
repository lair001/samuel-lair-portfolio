class SessionsController < JsonController

	def new

	end

	def create
		@user = User.find_by(username: params[:username].strip)
		if @user && !@user.banned? && @user.authenticate(params[:password].strip)
			@user.administrator? ? redirect_to(sidekiq_web_path) : redirect_to(root_path)
		else
			flash[:error] = "Your credentials are invalid."
			render :new
		end
	end

	def destroy
		reset_session
	end

end
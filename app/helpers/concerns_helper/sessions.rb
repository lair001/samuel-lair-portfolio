module ConcernsHelper
	module Sessions

		def current_user
			@current_user ||= User.find_by(id: session[:user_id], security_code: session[:security_code])
		end

		def user_signed_in?
			!!current_user
		end

		def reset_session_and_refresh_security_code
			reset_session
			@user.save #refresh security code
		end

		def sign_in_user
			reset_session_and_refresh_security_code
			session[:user_id] = @user.id
			session[:security_code] = @user.security_code
		end

		def sign_out_user
			reset_session_and_refresh_security_code
		end

	end
end
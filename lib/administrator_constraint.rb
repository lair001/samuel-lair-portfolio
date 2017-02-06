class AdministratorConstraint
	def matches?(request)
		return false unless request.session[:user_id] && request.session[:security_code]
		User.find_by(id: session[:user_id], security_code: session[:security_code])
		user && user.administrator?
	end
end
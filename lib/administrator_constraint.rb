class AdministratorConstraint
	def matches?(request)
		return false unless request.session[:user_id] && request.session[:security_code]
		user = User.find_by(id: request.session[:user_id], security_code: request.session[:security_code])
		user && user.administrator?
	end
end
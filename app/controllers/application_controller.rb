class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

protected

	include ApplicationHelper

end

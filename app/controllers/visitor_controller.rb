class VisitorController < ApplicationController

	def index
		@mail_contact = MailContact.new
	end

end

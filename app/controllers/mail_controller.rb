class MailController < ApplicationController

	def contact
		@mail_contact = MailContact.new(mail_contact_params)
		if @mail_contact.save
			redirect_to root_path
		else

		end
	end

private

	def mail_contact_params
		params.require(:mail_contact).permit(:last_name, :first_name, :email, :phone, :message)
	end

end
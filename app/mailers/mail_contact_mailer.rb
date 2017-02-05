class MailContactMailer < ApplicationMailer
	default from: 'mail_contacts@samlair.com'

	def send_contact_email(mail_contact)
		@mail_contact = mail_contact
		mail(to: 'lair001@gmail.com', from: @mail_contact.email, subject: 'Portfolio Contact')
	end

end

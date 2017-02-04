class MailContact < ApplicationRecord

	def last_name=(last_name)
		write_attribute(:last_name, self.class.format_last_name(last_name))
	end

	def first_name=(first_name)
		write_attribute(:first_name, self.class.format_first_name(first_name))
	end

	def email=(email)
		write_attribute(:email, self.class.format_email(email))
	end

	def phone=(phone)
		write_attribute(:phone, self.class.format_phone(phone))
	end

	def message=(message)
		write_attribute(:message, self.class.format_message(message))
	end


	def self.format_last_name(last_name)
		convert_whitespace_to_spaces_and_trim_whitespace_in(last_name).gsub("'", "’").split("’").collect{|section| section.capitalize}.join("’")
	end

	def self.format_first_name(first_name)
		convert_whitespace_to_spaces_and_trim_whitespace_in(first_name).gsub("'", "’").split("’").collect{|section| section.capitalize}.join("’")
	end

	def self.format_email(email)
		email.strip
	end

	def self.format_phone(phone)
		phone.blank? ? "" : convert_whitespace_to_spaces_and_trim_whitespace_in(phone).split('').keep_if{ |char| char.match(/\d/) }.insert(6, '-').insert(3, ')').insert(0, '(').join('')
	end

	def self.format_message(message)
		trim_whitespace_in(message)
	end

end

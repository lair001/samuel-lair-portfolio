class User < ApplicationRecord

	has_secure_password

	before_validation :generate_and_set_security_code
	after_destroy :destroy_contacts

	validates :username, { uniqueness: true, length: { in: 2..50 } }
	validates :email, { uniqueness: true, length: { in: 5..50 }, format: { with: email_regex } }
	validates :security_code, { length: { is: 128 } }
	validates :password, { length: { minimum: 6 } }

	validate do
		absence_of_forbidden_characters_in :username
		absence_of_forbidden_characters_in :email
		absence_of_whitespace_in :email
		absence_of_forbidden_characters_in :password
		absence_of_whitespace_in :password
	end

	enum role: [:banned, :administrator, :free]

	def username=(username)
		write_attribute(:username, self.class.format_username(username))
	end

	def generate_and_set_security_code
		self.security_code = SecureRandom.hex(64)
	end

	def self.format_username(username)
		strip_convert_whitespace_to_spaces_and_trim_whitespace_in(username)
	end

end

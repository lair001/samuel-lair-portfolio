class ApplicationRecord
	module Validatable
		module ClassMethods

			def self.email_regex
				/\A([^@]+@[^@]+\.[^.@\d]+|)\z/
			end

			def self.name_regex
				/\A[\w'’]{,25}\z/
			end

			def self.phone_regex
				/\A(\(\d{3}\)\d{3}-\d{4}|)\z/
			end

		end
	end
end
class ApplicationRecord < ActiveRecord::Base
	self.abstract_class = true

	include Forbiddable::InstanceMethods
	extend Whitespaceable::ClassMethods
	extend Validatable::ClassMethods
end

module FakerSpecHelper
	module Generators

		def unique_value(value_generator_lambda, model_class, model_attribute)
			while true
				value = value_generator_lambda.()
				return value unless model_class.exists?(model_attribute => value)
			end
		end

	end
end
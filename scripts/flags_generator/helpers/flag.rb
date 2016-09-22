class Flag 
	def initialize(name, values, default, description)
		@name = name
		@values = values
		@default = default
		@description = description
	end

	def classInstance 
		return @name+".self"
	end

	def objectName
		return @name 
	end

	def varName 
		return @name.uncapitalize
	end

	def casesParams
		return @values.join(', ')
	end

	def allCases
		params = Array.new
		@values.each do |value|
			params << "."+value
		end
		return "[]" if params.empty?
		return "["+params.join(', ')+"]"
	end

	def defaultCase
		return "."+@default
	end

	def description
		return @description
	end
end
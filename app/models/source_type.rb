class Source_type < ActiveRecord::Base
#Flags are set for the following properties:
#0 - 255 non-development flags
#0 County sourced information
#1 State wide sum
#2 Nation wide sum
#3 RESERVED
#0-255 && 256 => development


	attr_accessible :name, :flags
	has_many :sources
	
	##Methods  -  Bitwise checks
	
	def unsum?
		return !flags
	end
	def sum?
		return !!flags #remember a double bang converts to boolean
	end
	def state_sum?
		return (flags && 1)
	end
	def national_sum?
		return (flags && 2) || (flags && 3) 	#national sum must also be a state sum
	end
	def development?
		return (flags && 256)
	end
	def production?
		return !development?
	end

############implemented with seed.rb  Couldn't extend class in that file... v0.2.5 update

	
	def self.make(_name, _flags)
		tmp_Object = Source_type.new()
		tmp_Object.name = _name
		tmp_Object.flags = _flags
		tmp_Object.save()
		tmp_Object
	end

end
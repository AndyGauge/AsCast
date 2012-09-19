class Source_type < ActiveRecord::Base
#Source_type allieviates the strain of having SoS giving totals and counties giving partial values
	attr_accessible :name
	has_many :sources

#Practicing Bitwise operations
#Source.first.source_type.unsum? => Counties & Presincts
	def unsum?
		return !type
	end
	def sum?
		#remember a double bang converts to boolean
		return !!type
	end

	def state_sum?
		return (type && 1)
	end

	def national_sum?
		#national sum must also be a state sum
		return (type && 2) || (type && 3)
	end

############implemented with seed.rb  Couldn't extend class in that file... v0.2.5 update

	def force_type(_type)
		type = _type
		return self
	end
	def self.make(_name, _type)
		tmp_Object = Source_type.new()
		tmp_Object.name = _name
		tmp_Object.force_type(_type)
		tmp_Object.save()
		tmp_Object
	end

end
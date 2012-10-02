class Parser < ActiveRecord::Base

	##Tableless implementation, probably should have been a module.
	self.abstract_class = true

	belongs_to :source

	attr_accessible :mark

	##Methods
	def load
		if !source.body
			source.update_body
		end
		self.mark = Nokogiri::HTML(source.body)
	end

	def strip_formatting

	end


end
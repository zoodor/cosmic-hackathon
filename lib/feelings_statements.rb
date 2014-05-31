class FeelingsStatement	

	attr_accessor :id
	attr_accessor :title	

	def initialize(id, title)
		@id = id
		@title = title
	end

	def self.statements
	 	[
	 		FeelingsStatement.new(1, "Cleanliness"), 
	 		FeelingsStatement.new(2, "Video game selection"), 
	 		FeelingsStatement.new(3, "Other stuff")
	 	]
	end

end